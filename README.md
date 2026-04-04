# Cursor

![License](https://img.shields.io/github/license/iam74k4/Cursor)

Cursor IDE の共有ルール・ドキュメント・ワークスペース設定を管理するリポジトリ。

## 概要

複数プロジェクトで一貫した AI エージェントの振る舞いを保つため、Cursor ルールと MCP ドキュメントを一元管理する。

## 構成

```text
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
| Sift-iOS | `../Sift-iOS` | iOS 写真整理アプリ |
| DiscordBot | `../DiscordBot` | Discord Bot（TypeScript） |

## Setup

1. このリポジトリを `Cursor` として clone する。
2. 必要な関連リポジトリを `Cursor` と同じ親ディレクトリ配下に配置する。
3. Cursor で `Cursor.code-workspace` を開く。

兄弟ディレクトリ構成の例:

```text
Git/
├── Cursor
├── Sift-iOS
└── DiscordBot
```

## Usage

- ルール確認: `.cursor/rules/` を参照
- MCP 設定確認: `.cursor/Document/MCP.md` を参照
- 共有ワークスペース起動: `Cursor.code-workspace` を開く

## ルール一覧

| ルール | 適用条件 | 内容 |
|--------|----------|------|
| `git-rules.mdc` | 常時適用 | Conventional Commits、main only ブランチ戦略、SemVer、`v1.0.0` 開始のタグ運用 |
| `readme-rules.mdc` | `**/README.md` 編集時 | README の構造・バッジ・スタイル |
| `context7-rules.mdc` | 常時適用 | ライブラリドキュメント取得時に Context7 MCP を使用 |
| `drawio-rules.mdc` | 要時参照 | drawio MCP で図・ダイアグラムを作成・編集する際のガイド |

## Git / Release Policy

このリポジトリは `main` を唯一の長期運用ブランチとし、作業は `feat/*`、`fix/*`、`docs/*` などのトピックブランチで行う。

リモートへ push するコミットには、必ず `vMAJOR.MINOR.PATCH` 形式の注釈付きタグを対応付ける。最初の公開タグは `v1.0.0` とし、以後は SemVer に従って更新する。

- `MAJOR`: 後方互換を壊す変更
- `MINOR`: 後方互換を保った機能追加
- `PATCH`: 修正、保守、軽微な文書更新
- 迷ったときは `PATCH` を優先する

## License

[MIT](LICENSE)
