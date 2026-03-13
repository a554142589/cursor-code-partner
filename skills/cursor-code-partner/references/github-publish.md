# GitHub publishing pattern

Use this pattern when you want the skill to be downloadable like a public agent-rules repository.

## Distribution goals

Provide both of these:
1. a one-file quick install for easy sharing and copy-paste installation
2. a full pack for people who want modular rules, `AGENTS.md`, optional user rules, and custom modes

## Recommended public repo layout

```text
repo-root/
├── README.md
├── LICENSE
├── cursor/
│   ├── rules/
│   │   └── cursor-code-partner.mdc
│   └── pack/
│       ├── AGENTS.md
│       ├── USER_RULE.txt
│       ├── CUSTOM_MODE_SHIPMATE.md
│       └── .cursor/rules/*.mdc
├── skills/
│   └── cursor-code-partner/
└── scripts/
    ├── install.sh
    ├── install.ps1
    └── build-artifacts.sh
```

## README expectations

The README should make the install path obvious in the first screen:
- what the rule pack does
- who it is for
- single-file install command
- full-pack install command
- what files are included
- how to publish releases

## Release assets

Useful release assets are:
- `cursor-code-partner-cursor-pack.zip`
- `skill.zip`

## Publishing checklist

- verify the standalone `.mdc` file installs cleanly
- verify the full pack installer copies the expected files
- keep install commands raw-URL based for the public GitHub workflow
- include a clear license
- document how to push tags so GitHub Releases can attach artifacts
