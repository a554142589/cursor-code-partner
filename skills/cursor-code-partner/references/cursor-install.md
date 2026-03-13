# Install in Cursor

This skill bundles two Cursor-native installation shapes so the same behavior can run inside Cursor projects.

## What is included

### Option A: standalone quick install

Use one file when you want the fastest setup and pua-style distribution:
- `assets/cursor-pack/quick-install/cursor-code-partner.mdc`

This copies to:
- `.cursor/rules/cursor-code-partner.mdc`

### Option B: full modular pack

Use this when you want a more tunable setup:
- `AGENTS.md` for a compact all-in-one baseline
- `.cursor/rules/*.mdc` for composable project rules
- `USER_RULE.txt` for a global Cursor User Rule
- `CUSTOM_MODE_SHIPMATE.md` as a prompt snippet for a custom mode

## Recommended setup

- choose **standalone** when you want one easy-to-share file
- choose **full** when you want modular rules plus `AGENTS.md`

## With the install script

From this skill folder:

### Full pack

```bash
python scripts/install_cursor_pack.py /path/to/repo --mode full
```

### Standalone single-file rule

```bash
python scripts/install_cursor_pack.py /path/to/repo --mode single
```

Overwrite existing files when you mean it:

```bash
python scripts/install_cursor_pack.py /path/to/repo --mode full --force
```

Preview without writing anything:

```bash
python scripts/install_cursor_pack.py /path/to/repo --mode single --dry-run
```

## Manual install

### Standalone

Copy this file into the target repo:
- `assets/cursor-pack/quick-install/cursor-code-partner.mdc` -> `.cursor/rules/cursor-code-partner.mdc`

### Full pack

Copy these files into the target repo:
- `assets/cursor-pack/AGENTS.md` -> `AGENTS.md`
- `assets/cursor-pack/.cursor/rules/00-core-behavior.mdc` -> `.cursor/rules/00-core-behavior.mdc`
- `assets/cursor-pack/.cursor/rules/20-debug-and-verification.mdc` -> `.cursor/rules/20-debug-and-verification.mdc`
- `assets/cursor-pack/.cursor/rules/30-build-refactor-plan.mdc` -> `.cursor/rules/30-build-refactor-plan.mdc`
- `assets/cursor-pack/.cursor/rules/40-research-docs-and-proposals.mdc` -> `.cursor/rules/40-research-docs-and-proposals.mdc`

Optional extras:
- paste `assets/cursor-pack/USER_RULE.txt` into Cursor Settings -> Rules if you want the tone globally
- create a custom mode and paste the prompt from `assets/cursor-pack/CUSTOM_MODE_SHIPMATE.md`

## GitHub-friendly distribution

For public distribution, expose the standalone file at a stable raw URL so users can install it with one command. That mirrors the simplest PUA-style installation flow while still letting advanced users choose the full pack.

## Suggested Custom Mode tools

For one all-purpose mode, enable tools that cover:
- codebase search
- read file
- list directory
- grep or search files
- edit and apply changes
- terminal
- web

## Adaptation tips

- keep the standalone file opinionated but compact
- keep `00-core-behavior.mdc` as the stable base rule in the full pack
- add repo-specific commands, architecture notes, and known gotchas in additional project rules
- keep each rule focused instead of creating one giant file
