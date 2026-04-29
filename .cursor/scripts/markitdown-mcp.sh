#!/usr/bin/env bash
# MarkItDown MCP: prefer .cursor/venv-markitdown, else PATH (see .cursor/docs/mcp.md)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CURSOR_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VENV="${MARKITDOWN_MCP_VENV:-$CURSOR_DIR/venv-markitdown}"

if [[ -x "$VENV/bin/markitdown-mcp" ]]; then
  exec "$VENV/bin/markitdown-mcp" "$@"
fi

exec markitdown-mcp "$@"
