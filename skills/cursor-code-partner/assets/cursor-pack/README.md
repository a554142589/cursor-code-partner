# Cursor Code Partner Pack

This folder contains Cursor-native files that mirror the behavior of the main skill.

## Quick start

Choose one of these installation styles:

### 1. Standalone single-file rule

If you want the simplest pua-style setup, copy:
- `quick-install/cursor-code-partner.mdc` -> `.cursor/rules/cursor-code-partner.mdc`

### 2. Full modular pack

If you want the more tunable setup:
1. copy `AGENTS.md` to your repo root
2. copy `.cursor/rules/*.mdc` into `.cursor/rules/`

If you want the fastest local install from this packaged skill:

```bash
python scripts/install_cursor_pack.py /path/to/repo --mode full
```

## Included files

- `quick-install/cursor-code-partner.mdc`
  - standalone rule for quick public installation
- `AGENTS.md`
  - compact all-in-one behavior file
- `.cursor/rules/00-core-behavior.mdc`
  - always-on base rule for planning, tone, and honest handoff
- `.cursor/rules/20-debug-and-verification.mdc`
  - bug-fixing workflow and proof requirements
- `.cursor/rules/30-build-refactor-plan.mdc`
  - implementation, refactoring, and multi-file change workflow
- `.cursor/rules/40-research-docs-and-proposals.mdc`
  - research, docs, RFCs, and professional方案 workflow
- `USER_RULE.txt`
  - optional global Cursor User Rule snippet
- `CUSTOM_MODE_SHIPMATE.md`
  - text to paste into a custom mode instruction field
