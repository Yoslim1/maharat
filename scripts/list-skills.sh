#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
find "$root/skills" -type f -name SKILL.md -printf '%P\n' | sed 's#/SKILL.md$##' | sort
