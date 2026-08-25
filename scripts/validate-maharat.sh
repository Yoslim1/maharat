#!/usr/bin/env bash
set -euo pipefail
cd /home/ubuntu/maharat

# Markdown and Git hygiene.
git diff --check
python3 -m json.tool upstreams/manifest.json >/dev/null
python3 -m json.tool upstreams/source-commits.txt >/dev/null 2>/dev/null || true

# Every packaged entrypoint must have frontmatter, name, and description.
count=0
while IFS= read -r skill; do
  count=$((count + 1))
  head -n 1 "$skill" | grep -qx -- '---'
  sed -n '2,/^---$/p' "$skill" | grep -Eq '^name:[[:space:]]*[^[:space:]].*$'
  sed -n '2,/^---$/p' "$skill" | grep -Eq '^description:[[:space:]]*.*$'
done < <(find skills -type f -name SKILL.md | sort)
[ "$count" -gt 0 ]

# Required documentation and license evidence.
for f in README.md CATALOG.md ATTRIBUTION.md SECURITY.md LICENSE \
  licenses/amelnagdy-guard-skills-MIT.txt \
  licenses/amelnagdy-ui-review-loop-Apache-2.0.txt \
  licenses/amelnagdy-review-skills-MIT.txt; do
  test -s "$f"
done

# No source control directories, environment files, or obvious private keys in the payload.
! find . -path './.git' -prune -o -type d -name '.git' -print | grep -q .
! find . -path './.git' -prune -o -type f \( -name '*.env' -o -name '*.pem' -o -name 'id_rsa' \) -print | grep -q .

printf 'VALID_SKILLS=%s\n' "$count"
printf 'TOTAL_FILES=%s\n' "$(git ls-files | wc -l)"
printf 'SIZE='; du -sh . | cut -f1
