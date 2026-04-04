# .cursor Index

`.cursor/` 配下のルール、ドキュメント、補助スクリプトの入口。

## Agents

| パス | 用途 |
|------|------|
| `agents/README.md` | Agent 定義を置く場所と運用方針 |

## Documents

| パス | 用途 |
|------|------|
| `Document/MCP.md` | MCP サーバーの設定方法、利用中サーバー、トラブルシューティング |

## Rules

| パス | 用途 |
|------|------|
| `rules/README.md` | 共有ルールの索引 |
| `rules/Git/git-rules.mdc` | Git ワークフロー、Conventional Commits、タグ運用 |
| `rules/Document/readme-rules.mdc` | README の構造と記述ルール |
| `rules/MCP/context7-rules.mdc` | Context7 を使う場面のルール |
| `rules/MCP/drawio-rules.mdc` | draw.io MCP 利用時の補助ルール |

## Scripts

| パス | 用途 |
|------|------|
| `scripts/README.md` | スクリプト一覧と前提環境 |
| `scripts/drawio-mcp.sh` | drawio MCP 起動前のクリーンアップ付きラッパー |

## Quick Start

1. ワークスペース全体の入口はリポジトリ直下の `README.md` を確認する。
2. Agent 定義を追加するときは `agents/README.md` を確認する。
3. MCP を使うときは `Document/MCP.md` を確認する。
4. 共有ルールを確認するときは `rules/README.md` から辿る。
5. 補助スクリプトを使うときは `scripts/README.md` を確認する。
