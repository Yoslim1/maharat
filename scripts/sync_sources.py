#!/usr/bin/env python3
"""Synchronize explicitly allow-listed Agent Skill paths from public upstream repos.

The script only clones and copies files. It never imports, executes, or evaluates upstream code.
Use --check in CI to validate the manifest and upstream paths without changing the worktree.
"""
from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "upstreams" / "sync-manifest.json"
COMMITS = ROOT / "upstreams" / "source-commits.txt"
SKILL_FILES = ROOT / "upstreams" / "skill-files.txt"


def run(command: list[str], cwd: Path | None = None) -> str:
    result = subprocess.run(command, cwd=cwd, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return result.stdout.strip()


def safe_relative(value: str) -> Path:
    path = Path(value)
    if path.is_absolute() or ".." in path.parts:
        raise ValueError(f"unsafe relative path: {value}")
    return path


def assert_no_symlink(path: Path) -> None:
    if path.is_symlink():
        raise ValueError(f"symlink is not allowed in synchronized content: {path}")


def copy_file(source: Path, destination: Path) -> None:
    assert_no_symlink(source)
    if not source.is_file():
        raise FileNotFoundError(source)
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)


def copy_tree(source: Path, destination: Path, exclude: set[str] | None = None, contents: bool = False) -> None:
    assert_no_symlink(source)
    if not source.is_dir():
        raise NotADirectoryError(source)
    exclude = exclude or set()
    destination.mkdir(parents=True, exist_ok=True)
    for item in source.iterdir():
        if item.name in exclude:
            continue
        assert_no_symlink(item)
        target = destination / item.name
        if item.is_dir():
            copy_tree(item, target, exclude=exclude, contents=False)
        elif item.is_file():
            copy_file(item, target)
        else:
            raise ValueError(f"unsupported upstream filesystem entry: {item}")


def remove_destination(path: Path) -> None:
    if path.is_symlink():
        raise ValueError(f"refusing to remove symlink destination: {path}")
    if path.is_dir():
        shutil.rmtree(path)
    elif path.exists():
        path.unlink()


def sync_source(source: dict, checkout_root: Path, check_only: bool) -> tuple[str, str]:
    repo_id = source["id"]
    checkout = checkout_root / repo_id
    run(["git", "clone", "--depth", "1", source["repo"], str(checkout)])
    commit = run(["git", "rev-parse", "HEAD"], cwd=checkout)

    for item in source["paths"]:
        source_path = safe_relative(item["source"])
        destination = ROOT / safe_relative(item["destination"])
        origin = checkout / source_path
        if not origin.exists() or origin.is_symlink():
            raise FileNotFoundError(f"{repo_id}: missing or unsafe source path {item['source']}")
        if check_only:
            continue
        remove_destination(destination)
        mode = item.get("mode", "tree")
        if mode == "file":
            copy_file(origin, destination)
        elif mode == "contents":
            copy_tree(origin, destination, exclude=set(item.get("exclude", [])), contents=True)
        elif mode == "tree":
            copy_tree(origin, destination, exclude=set(item.get("exclude", [])), contents=False)
        else:
            raise ValueError(f"{repo_id}: unsupported copy mode {mode}")

    license_source = checkout / safe_relative(source["license_source"])
    if not license_source.is_file() or license_source.is_symlink():
        raise FileNotFoundError(f"{repo_id}: missing license {source['license_source']}")
    if not check_only:
        copy_file(license_source, ROOT / safe_relative(source["license_destination"]))
    return repo_id, commit


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true", help="clone and validate paths without changing the repository")
    args = parser.parse_args()
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    commits: list[tuple[str, str]] = []
    with tempfile.TemporaryDirectory(prefix="maharat-sync-") as tmp:
        checkout_root = Path(tmp)
        for source in manifest["sources"]:
            commits.append(sync_source(source, checkout_root, args.check))

    if not args.check:
        lines = ["# Upstream commit snapshots", ""]
        for repo_id, commit in sorted(commits):
            lines.append(f"{repo_id:<48} {commit}")
        COMMITS.write_text("\n".join(lines) + "\n", encoding="utf-8")
        skills = sorted(str(path.relative_to(ROOT)) for path in (ROOT / "skills").rglob("SKILL.md"))
        SKILL_FILES.write_text("\n".join(skills) + "\n", encoding="utf-8")
    print(f"validated {len(commits)} sources" + (" (check only)" if args.check else " and synchronized them"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
