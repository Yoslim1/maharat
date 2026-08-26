#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

# Markdown and Git hygiene.
git diff --check
python3 -m json.tool upstreams/manifest.json >/dev/null
python3 -m json.tool upstreams/sync-manifest.json >/dev/null
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

# Selected global entrypoints must remain discoverable.
for skill in \
  skills/web/jakub-better-interface/SKILL.md \
  skills/web/jakub-better-colors/SKILL.md \
  skills/web/visual-edit-precision/SKILL.md \
  skills/architecture/api-design-principles/SKILL.md \
  skills/architecture/architecture-patterns/SKILL.md \
  skills/data/exploratory-data-analysis/SKILL.md \
  skills/data/scientific-visualization/SKILL.md \
  skills/data/statistical-analysis/SKILL.md \
  skills/workflow/before-you-build/SKILL.md \
  skills/workflow/bounded-self-improvement/SKILL.md; do
  test -s "$skill"
done

# Required documentation and license evidence.
for f in README.md CATALOG.md ATTRIBUTION.md SECURITY.md LICENSE \
  licenses/amelnagdy-guard-skills-MIT.txt \
  licenses/amelnagdy-ui-review-loop-Apache-2.0.txt \
  licenses/amelnagdy-review-skills-MIT.txt \
  licenses/jakubkrehel-skills-MIT \
  licenses/wshobson-agents-MIT \
  licenses/k-dense-scientific-agent-skills-MIT.md \
  upstreams/self-improving-agent.md \
  docs/global-skill-selection-ar.md; do
  test -s "$f"
done

# No source control directories, environment files, or obvious private keys in the payload.
! find . -path './.git' -prune -o -type d -name '.git' -print | grep -q .
! find . -path './.git' -prune -o -type f \( -name '*.env' -o -name '*.pem' -o -name 'id_rsa' \) -print | grep -q .

printf 'VALID_SKILLS=%s\n' "$count"
printf 'TOTAL_FILES=%s\n' "$(git ls-files | wc -l)"
printf 'SIZE='; du -sh . | cut -f1
