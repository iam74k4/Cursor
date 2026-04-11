# Scripts

Index of helper scripts under `.cursor/scripts/`.

## Prerequisites

- Scripts in this directory may be referenced directly by Cursor.
- `drawio-mcp.sh` uses `bash`, `pkill`, `lsof`, and `ps`.
- On Windows, it assumes an environment such as WSL or Git Bash with Unix-style commands available.

## Available Scripts

| Script | Purpose |
|--------|---------|
| `drawio-mcp.sh` | Stops existing processes before starting draw.io MCP to avoid port conflicts |

## Related Documents

- See `../README.md` for the main `.cursor` index.
- See `../docs/mcp.md` for MCP setup and server details.
- See `../rules/mcp/drawio-rules.mdc` for draw.io-specific rules.
