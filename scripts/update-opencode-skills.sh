#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
dest_dir="${OPENCODE_SKILLS_DIR:-$HOME/.config/opencode/skills}"
branch="${MAHARAT_BRANCH:-master}"
lock_file="${MAHARAT_UPDATE_LOCK:-/tmp/maharat-opencode-update.lock}"

exec 9>"$lock_file"
if ! flock -n 9; then
  echo "Another Maharat/OpenCode update is already running; exiting." >&2
  exit 0
fi

cd "$repo_root"
if [ -n "$(git status --porcelain)" ]; then
  echo "Maharat has local changes; refusing to overwrite them." >&2
  exit 3
fi

git fetch --quiet origin "$branch"
git merge --ff-only "origin/$branch"
bash "$repo_root/scripts/validate-maharat.sh"

mkdir -p "$dest_dir"
installed=0
while IFS= read -r skill_file; do
  skill_dir="${skill_file%/SKILL.md}"
  bash "$repo_root/scripts/install-skill.sh" "$skill_dir" "$dest_dir"
  installed=$((installed + 1))
done < <(git ls-files 'skills/**/SKILL.md' | sort)

printf 'Updated OpenCode skills: %s\n' "$installed"
printf 'Destination: %s\n' "$dest_dir"
printf 'Maharat commit: %s\n' "$(git rev-parse --short HEAD)"
