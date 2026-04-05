# Cursor

![License](https://img.shields.io/github/license/iam74k4/Cursor)

This repository manages shared Cursor IDE rules, documentation, and workspace settings.

## Overview

It centralizes Cursor rules, MCP documentation, and helper scripts so multiple projects can follow a consistent AI agent workflow.

## Structure

```text
.cursor/
├── README.md                  # Index for the .cursor directory
├── agents/
│   └── README.md              # Agent definition placement and conventions
├── Document/
│   └── MCP.md                 # MCP server usage guide
├── rules/
│   ├── Git/
│   │   └── git-rules.mdc      # Git workflow and commit conventions
│   ├── Document/
│   │   └── readme-rules.mdc   # README structure and style
│   └── MCP/
│       ├── context7-rules.mdc # Context7 integration rules
│       └── drawio-rules.mdc   # draw.io MCP diagram guidance
└── scripts/
    ├── README.md              # Script index
    └── drawio-mcp.sh          # draw.io MCP startup wrapper
```

## Workspace

`Cursor.code-workspace` groups the following projects into a multi-root workspace.

| Folder | Path | Description |
|--------|------|-------------|
| Cursor | `.` | This repository for shared rules and settings |
| Sift-iOS | `../Sift-iOS` | iOS photo organization app |
| DiscordBot | `../DiscordBot` | Discord bot in TypeScript |

## Setup

1. Clone this repository as `Cursor`.
2. Place related repositories under the same parent directory as `Cursor`.
3. Open `Cursor.code-workspace` in Cursor.

Recommended directory layout:

```text
Git/
├── Cursor
├── Sift-iOS
└── DiscordBot
```

## Documentation

- Main index: `.cursor/README.md`
- MCP setup guide: `.cursor/Document/MCP.md`
- Rules index: `.cursor/rules/README.md`
- Script index: `.cursor/scripts/README.md`
- Agent conventions: `.cursor/agents/README.md`

## Rules

| Rule | Applies when | Purpose |
|------|--------------|---------|
| `git-rules.mdc` | Always | Conventional Commits, main-only workflow, SemVer, and release tags starting from `v1.0.0` |
| `readme-rules.mdc` | When editing `**/README.md` | README structure, badges, and writing style |
| `context7-rules.mdc` | Always | Use Context7 MCP when fetching library documentation |
| `drawio-rules.mdc` | As needed | Guidance for creating and editing diagrams with draw.io MCP |

For more detail on Git workflow rules, start from `.cursor/rules/README.md`.

## License

[MIT](LICENSE)
