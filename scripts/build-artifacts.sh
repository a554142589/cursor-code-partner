#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"

rm -rf "$DIST"
mkdir -p "$DIST"

(
  cd "$ROOT/cursor/pack"
  zip -qry "$DIST/cursor-code-partner-cursor-pack.zip" .
)

(
  cd "$ROOT/skills"
  zip -qry "$DIST/skill.zip" cursor-code-partner
)

echo "Built artifacts:"
ls -lh "$DIST"
