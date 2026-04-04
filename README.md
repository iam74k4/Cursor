# Cursor

![License](https://img.shields.io/github/license/iam74k4/Cursor)

Cursor IDE の共有ルール・ドキュメント・ワークスペース設定を管理するリポジトリ。

## 概要

複数プロジェクトで一貫した AI エージェントの振る舞いを保つため、Cursor のルール、MCP ドキュメント、補助スクリプトを一元管理する。

## 構成

```text
.cursor/
├── README.md                  # .cursor 配下の索引
├── agents/
│   └── README.md              # Agent 定義の配置方針
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
    ├── README.md              # スクリプト一覧
    └── drawio-mcp.sh          # drawio MCP 起動ラッパー（ポート競合対策）
```

## ワークスペース

`Cursor.code-workspace` でマルチルートワークスペースとして以下のプロジェクトを束ねている。

| フォルダ | パス | 説明 |
|----------|------|------|
| Cursor | `.` | 本リポジトリ（ルール・設定） |
| Sift-iOS | `../Sift-iOS` | iOS 写真整理アプリ |
| DiscordBot | `../DiscordBot` | Discord Bot（TypeScript） |

## Setup

1. このリポジトリを `Cursor` として clone する。
2. 必要な関連リポジトリを `Cursor` と同じ親ディレクトリ配下に配置する。
3. Cursor で `Cursor.code-workspace` を開く。

推奨ディレクトリ構成:

```text
Git/
├── Cursor
├── Sift-iOS
└── DiscordBot
```

## ドキュメント案内

- 全体索引: `.cursor/README.md`
- MCP 設定: `.cursor/Document/MCP.md`
- ルール索引: `.cursor/rules/README.md`
- スクリプト一覧: `.cursor/scripts/README.md`
- Agent 定義方針: `.cursor/agents/README.md`

## ルール一覧

| ルール | 適用条件 | 内容 |
|--------|----------|------|
| `git-rules.mdc` | 常時適用 | Conventional Commits、main only ブランチ戦略、SemVer、`v1.0.0` 開始のタグ運用 |
| `readme-rules.mdc` | `**/README.md` 編集時 | README の構造・バッジ・スタイル |
| `context7-rules.mdc` | 常時適用 | ライブラリドキュメント取得時に Context7 MCP を使用 |
| `drawio-rules.mdc` | 要時参照 | drawio MCP で図・ダイアグラムを作成・編集する際のガイド |

Git 運用の詳細は `.cursor/rules/README.md` から辿れる。

## License

[MIT](LICENSE)
