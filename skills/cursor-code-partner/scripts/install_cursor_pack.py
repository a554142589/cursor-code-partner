#!/usr/bin/env python3
"""Install the bundled Cursor pack into a target repository."""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path


def build_plan(pack_root: Path, repo_root: Path, *, mode: str) -> list[tuple[Path, Path]]:
    plan: list[tuple[Path, Path]] = []

    if mode == "single":
        standalone = pack_root / "quick-install" / "cursor-code-partner.mdc"
        if standalone.exists():
            plan.append((standalone, repo_root / ".cursor" / "rules" / "cursor-code-partner.mdc"))
        return plan

    agents_md = pack_root / "AGENTS.md"
    if agents_md.exists():
        plan.append((agents_md, repo_root / "AGENTS.md"))

    rules_root = pack_root / ".cursor" / "rules"
    for src in sorted(rules_root.glob("*.mdc")):
        plan.append((src, repo_root / ".cursor" / "rules" / src.name))

    return plan


def copy_file(src: Path, dst: Path, *, force: bool, dry_run: bool) -> tuple[str, str]:
    if dst.exists() and not force:
        return "skip", f"SKIP  {dst} (already exists; use --force to overwrite)"

    action = "COPY"
    if dst.exists() and force:
        action = "OVERWRITE"

    if not dry_run:
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)

    return "ok", f"{action:<9}{src.name} -> {dst}"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Copy the bundled Cursor project files into a repository."
    )
    parser.add_argument("repo", help="Path to the target repository or project folder")
    parser.add_argument(
        "--mode",
        choices=["full", "single"],
        default="full",
        help="Install the full modular pack or only the standalone single-file rule.",
    )
    parser.add_argument("--force", action="store_true", help="Overwrite existing files")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be copied without writing files")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    script_path = Path(__file__).resolve()
    skill_root = script_path.parent.parent
    pack_root = skill_root / "assets" / "cursor-pack"
    repo_root = Path(args.repo).expanduser().resolve()

    if not pack_root.exists():
        print(f"ERROR: Cursor pack not found: {pack_root}", file=sys.stderr)
        return 1

    if not repo_root.exists() or not repo_root.is_dir():
        print(f"ERROR: target directory not found: {repo_root}", file=sys.stderr)
        return 1

    plan = build_plan(pack_root, repo_root, mode=args.mode)
    if not plan:
        print("ERROR: nothing to install; selected pack is empty", file=sys.stderr)
        return 1

    print(f"Target: {repo_root}")
    print(f"Mode: {args.mode}")
    if args.dry_run:
        print("Write mode: dry-run")
    elif args.force:
        print("Write mode: overwrite existing files")
    else:
        print("Write mode: copy missing files only")
    print()

    skipped = 0
    for src, dst in plan:
        status, message = copy_file(src, dst, force=args.force, dry_run=args.dry_run)
        print(message)
        if status == "skip":
            skipped += 1

    print()
    if args.mode == "full":
        print("Optional files not copied automatically:")
        print(f"- User Rule snippet: {pack_root / 'USER_RULE.txt'}")
        print(f"- Custom mode prompt: {pack_root / 'CUSTOM_MODE_SHIPMATE.md'}")
        print()

    if skipped:
        print(f"Done with {skipped} skipped file(s).")
    else:
        print("Done.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
