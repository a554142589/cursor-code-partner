#!/usr/bin/env bash
set -euo pipefail

MODE="full"
TARGET="."
FORCE=0
BASE_URL=""

usage() {
  cat <<'USAGE'
Usage:
  bash scripts/install.sh [--target <path>] [--mode full|single] [--force] [--base-url <raw-base-url>]

Examples:
  bash scripts/install.sh --target /path/to/project --mode full
  curl -fsSL https://raw.githubusercontent.com/<owner>/<repo>/main/scripts/install.sh | \
    bash -s -- --base-url https://raw.githubusercontent.com/<owner>/<repo>/main --target . --mode single
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --mode)
      MODE="$2"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --base-url)
      BASE_URL="${2%/}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ "$MODE" != "full" && "$MODE" != "single" ]]; then
  echo "Invalid mode: $MODE" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"

copy_or_download() {
  local src_rel="$1"
  local dst_rel="$2"
  local dst="$TARGET/$dst_rel"

  if [[ -e "$dst" && "$FORCE" -ne 1 ]]; then
    echo "SKIP  $dst (already exists; use --force to overwrite)"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [[ -n "$BASE_URL" ]]; then
    curl -fsSL "$BASE_URL/$src_rel" -o "$dst"
  else
    if [[ ! -f "$REPO_ROOT/$src_rel" ]]; then
      echo "Missing source file: $REPO_ROOT/$src_rel" >&2
      exit 1
    fi
    cp "$REPO_ROOT/$src_rel" "$dst"
  fi

  echo "OK    $src_rel -> $dst"
}

if [[ -n "$BASE_URL" ]]; then
  echo "Source: remote ($BASE_URL)"
else
  echo "Source: local repo ($REPO_ROOT)"
fi

echo "Target: $TARGET"
echo "Mode: $MODE"
echo

if [[ "$MODE" == "single" ]]; then
  copy_or_download "cursor/rules/cursor-code-partner.mdc" ".cursor/rules/cursor-code-partner.mdc"
else
  copy_or_download "cursor/pack/AGENTS.md" "AGENTS.md"
  copy_or_download "cursor/pack/.cursor/rules/00-core-behavior.mdc" ".cursor/rules/00-core-behavior.mdc"
  copy_or_download "cursor/pack/.cursor/rules/20-debug-and-verification.mdc" ".cursor/rules/20-debug-and-verification.mdc"
  copy_or_download "cursor/pack/.cursor/rules/30-build-refactor-plan.mdc" ".cursor/rules/30-build-refactor-plan.mdc"
  copy_or_download "cursor/pack/.cursor/rules/40-research-docs-and-proposals.mdc" ".cursor/rules/40-research-docs-and-proposals.mdc"
  echo
  echo "Optional extras not installed automatically:"
  if [[ -n "$BASE_URL" ]]; then
    echo "- $BASE_URL/cursor/pack/USER_RULE.txt"
    echo "- $BASE_URL/cursor/pack/CUSTOM_MODE_SHIPMATE.md"
  else
    echo "- $REPO_ROOT/cursor/pack/USER_RULE.txt"
    echo "- $REPO_ROOT/cursor/pack/CUSTOM_MODE_SHIPMATE.md"
  fi
fi
