#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="skills/fast-ppt-master"
OUT="fast-ppt-master-skill.tar.gz"

tar -czf "$OUT" "$SKILL_DIR"
echo "Packed → $OUT ($(du -sh "$OUT" | cut -f1))"
