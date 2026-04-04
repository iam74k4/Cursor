# Rules

`.cursor/rules/` 配下の共有ルール一覧。

## ディレクトリ構成

| パス | 用途 |
|------|------|
| `Git/` | Git ワークフロー、コミット、ブランチ、タグ運用 |
| `Document/` | README などドキュメント編集時のルール |
| `MCP/` | MCP 利用時の補助ルール |

## 主なルール

| パス | 用途 |
|------|------|
| `Git/git-rules.mdc` | Conventional Commits、main only 運用、SemVer タグ運用 |
| `Document/readme-rules.mdc` | README の構造、バッジ、見出し順 |
| `MCP/context7-rules.mdc` | 最新ライブラリドキュメント取得時の Context7 利用 |
| `MCP/drawio-rules.mdc` | draw.io MCP で図を作成・編集するときの補助 |

## 使い分け

- 常時参照する全体ルールは `Git/` を確認する
- README などの文章整備では `Document/` を確認する
- MCP を使う作業では `MCP/` を確認する

## 関連

- 全体索引: `../README.md`
- MCP 設定: `../Document/MCP.md`
- 補助スクリプト: `../scripts/README.md`
