#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <repo-relative-skill-path> <agent-skills-directory>" >&2
  echo "Example: $0 skills/web/ui-ux-pro-max ~/.claude/skills" >&2
  exit 2
fi

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
source_rel="$1"
target_dir="${2/#\~/\$HOME}"
source_dir="$repo_root/$source_rel"

case "$source_rel" in
  /*|*..*) echo "Source path must be relative and must not contain .." >&2; exit 2;;
esac

if [ ! -f "$source_dir/SKILL.md" ]; then
  echo "No SKILL.md found at $source_rel" >&2
  exit 1
fi

mkdir -p "$target_dir"
name="$(basename "$source_dir")"
rm -rf "$target_dir/$name"
cp -a "$source_dir" "$target_dir/$name"
printf 'Installed %s into %s\n' "$name" "$target_dir/$name"
