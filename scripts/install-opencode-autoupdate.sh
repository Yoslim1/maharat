#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
log_dir="${MAHARAT_LOG_DIR:-$HOME/.cache}"
cron_schedule="${MAHARAT_CRON_SCHEDULE:-17 4 * * *}"
marker="maharat-opencode-auto-update"
log_file="$log_dir/maharat-opencode-update.log"

mkdir -p "$log_dir"
cron_line="$cron_schedule cd '$repo_root' && /bin/bash '$repo_root/scripts/update-opencode-skills.sh' >> '$log_file' 2>&1 # $marker"

existing="$(crontab -l 2>/dev/null || true)"
filtered="$(printf '%s\n' "$existing" | grep -v "$marker" || true)"
printf '%s\n%s\n' "$filtered" "$cron_line" | sed '/^$/N;/^\n$/D' | crontab -

printf 'Installed daily OpenCode update in the user crontab.\n'
printf 'Schedule: %s\n' "$cron_schedule"
printf 'Log: %s\n' "$log_file"
printf 'To remove it: crontab -l | grep -v %s | crontab -\n' "$marker"
