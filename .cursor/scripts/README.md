# Scripts

`.cursor/scripts/` 配下の補助スクリプト一覧。

## 前提

- このディレクトリのスクリプトは Cursor から直接参照されることがある
- `drawio-mcp.sh` は `bash`、`pkill`、`lsof`、`ps` を使う
- Windows では WSL または Git Bash など Unix 系コマンドが使える環境を前提とする

## 一覧

| スクリプト | 用途 |
|------------|------|
| `drawio-mcp.sh` | drawio MCP 起動前に既存プロセスを終了し、ポート競合を防ぐ |

## 使い分け

- 全体索引は `../README.md`
- MCP の設定方法や接続先の説明は `../Document/MCP.md`
- draw.io 用ルールの確認は `../rules/MCP/drawio-rules.mdc`
