# Cursor

![License](https://img.shields.io/github/license/iam74k4/Cursor)

Cursor IDE の共有ルール・ドキュメント・ワークスペース設定を管理するリポジトリ。

## 概要

複数プロジェクトで一貫した AI エージェントの振る舞いを保つため、Cursor ルールと MCP ドキュメントを一元管理する。

## 構成

```
.cursor/
├── Document/
│   └── MCP.md                 # MCP サーバーの利用ガイド
├── rules/
│   ├── Git/
│   │   └── git-rules.mdc      # Git ワークフロー・コミット規約
│   ├── Document/
│   │   └── readme-rules.mdc   # README 構造・スタイル
│   └── MCP/
│       ├── context7-rules.mdc  # Context7 統合ルール
│       └── drawio-rules.mdc   # drawio MCP で図を作成・編集
└── scripts/
    ├── drawio-mcp.sh          # drawio MCP 起動ラッパー（ポート競合対策）
    └── README.md              # スクリプト一覧
```

## ワークスペース

`Cursor.code-workspace` でマルチルートワークスペースとして以下のプロジェクトを束ねている。

| フォルダ | パス | 説明 |
|----------|------|------|
| Cursor | `.` | 本リポジトリ（ルール・設定） |
| Sift-iOS | `../Git/Sift-iOS` | iOS 写真整理アプリ |
| DiscordBot | `../Git/DiscordBot` | Discord Bot（TypeScript） |

## ルール一覧

| ルール | 適用条件 | 内容 |
|--------|----------|------|
| `git-rules.mdc` | 常時適用 | Conventional Commits、main/develop ブランチ戦略、SemVer |
| `readme-rules.mdc` | `**/README.md` 編集時 | README の構造・バッジ・スタイル |
| `context7-rules.mdc` | 常時適用 | ライブラリドキュメント取得時に Context7 MCP を使用 |
| `drawio-rules.mdc` | 要時参照 | drawio MCP で図・ダイアグラムを作成・編集する際のガイド |

## License

[MIT](LICENSE)
