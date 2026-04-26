# MarkItDown MCP

![MCP](https://img.shields.io/badge/MCP-MarkItDown-blue)

Docker-based Cursor setup for Microsoft's `markitdown-mcp` server.

## Overview

`markitdown-mcp` exposes a single MCP tool, `convert_to_markdown(uri)`, that converts `http:`, `https:`, `file:`, and `data:` URIs to Markdown.

This setup uses Docker so Cursor can run the server without depending on a project-local Python virtual environment.

## Prerequisites

1. Docker is installed and running.
2. Cursor can execute `docker` from the same environment where MCP servers are launched.

## Setup

1. Build the image from this directory:

   ```bash
   docker build -t cursor-markitdown-mcp:latest .
   ```

2. Copy the server entry from `cursor-mcp.example.json` into `~/.cursor/mcp.json` or `.cursor/mcp.json`.
3. Replace `/absolute/path/to/readable/files` with the local directory that MarkItDown may read.
4. Fully restart Cursor and confirm the `markitdown` MCP server is healthy in `Cursor Settings > MCP`.

## Usage

Ask the agent to convert a URI to Markdown. Examples:

```text
Use markitdown to convert file:///workdir/example.pdf to Markdown.
Use markitdown to convert https://example.com to Markdown.
```

Inside Docker, mounted files are available below `/workdir`. For example, if `/home/user/docs` is mounted to `/workdir`, then `/home/user/docs/report.pdf` is available as `file:///workdir/report.pdf`.

## Optional HTTP Mode

STDIO is the recommended transport for Cursor. For manual inspection, you can run the server with Streamable HTTP and SSE:

```bash
docker run --rm -p 127.0.0.1:3001:3001 cursor-markitdown-mcp:latest --http --host 0.0.0.0 --port 3001
```

Then connect an MCP inspector to:

- Streamable HTTP: `http://127.0.0.1:3001/mcp`
- SSE: `http://127.0.0.1:3001/sse`

Only bind the published Docker port to `127.0.0.1`. The server has no authentication and can read files accessible to the container.

## Security

- Treat this as a local trusted MCP server.
- Mount only directories that the MCP server should be able to read.
- Prefer read-only mounts with `:ro`.
- Do not expose HTTP or SSE transports to other machines.

## References

- [Microsoft MarkItDown MCP](https://github.com/microsoft/markitdown/tree/main/packages/markitdown-mcp)
- [markitdown-mcp on PyPI](https://pypi.org/project/markitdown-mcp/)
