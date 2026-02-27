# MCP（Model Context Protocol）利用方法

## 概要

MCP は、AI に外部ツールやデータソースへのアクセスを提供するオープンプロトコル。
Cursor では Composer の Agent モードで MCP ツールが利用できる。

## 設定ファイル

- **グローバル**: `~/.cursor/mcp.json`（全プロジェクト共通）
- **プロジェクト単位**: `.cursor/mcp.json`（プロジェクトルートに配置）

## 導入済み MCP サーバー

### 1. Context7

最新のライブラリドキュメント・コード例を AI に提供する。

| 項目 | 内容 |
|------|------|
| 接続方式 | リモート（URL） |
| Node.js | 不要 |
| 無料枠 | 月 1,000 API コール |
| API キー | [context7.com](https://context7.com) で取得 |

**使い方**

プロンプトに `use context7` を追加する。

```
React Query でクエリを無効化するには？ use context7
```

ライブラリ ID を直接指定することもできる。

```
use context7 with /vercel/next.js for app router setup
```

**参考**: [Context7 公式ドキュメント](https://context7.com/docs/overview)

---

### 2. GitHub

Issue の作成・管理・検索など、GitHub の操作を AI 経由で行う。

| 項目 | 内容 |
|------|------|
| 接続方式 | ローカル（npx） |
| Node.js | 必要 |
| 認証 | GitHub Personal Access Token（`repo` スコープ） |

**主なツール**

| ツール | 機能 |
|--------|------|
| `issue_create` | Issue 作成 |
| `issue_update` | Issue 更新 |
| `issue_list` / `issue_search` | Issue 一覧・検索 |
| `issue_comment` | コメント追加 |
| `issue_close` / `issue_reopen` | クローズ / 再オープン |
| `issue_assign` | 担当者設定 |
| `issue_add_labels` | ラベル追加 |

**PAT の発行先**: [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)

**参考**: [modelcontextprotocol/servers - GitHub](https://github.com/modelcontextprotocol/servers)

---

### 3. draw.io

ブラウザ上の Draw.io（diagrams.net）を AI から操作して図を作成・編集する。

| 項目 | 内容 |
|------|------|
| 接続方式 | ローカル（npx） |
| Node.js | v20 以上 |
| 追加要件 | Draw.io MCP ブラウザ拡張 |

**事前準備**

1. [Draw.io MCP Browser Extension](https://github.com/lgazo/drawio-mcp-extension) をインストール
2. ブラウザで [app.diagrams.net](https://app.diagrams.net/) を開く
3. 拡張アイコンが緑（接続中）であることを確認

**主なツール**

| カテゴリ | ツール例 |
|----------|----------|
| 図の確認 | `get-selected-cell`, `list-paged-model`, `get-shape-categories` |
| 図の編集 | `add-rectangle`, `add-edge`, `add-cell-of-shape`, `edit-cell` |
| 削除 | `delete-cell-by-id` |
| レイヤー | `list-layers`, `create-layer`, `set-active-layer` |

**参考**: [lgazo/drawio-mcp-server](https://github.com/lgazo/drawio-mcp-server)

---

## Cursor プラグイン経由の MCP サーバー

以下は Cursor プラグインをインストールすると自動的に有効化される MCP サーバー。`mcp.json` での設定は不要。

### 4. Figma

Figma デザインファイルの読み取りや Code Connect（デザインとコードの紐付け）に使用する。

| 項目 | 内容 |
|------|------|
| 提供元 | Figma プラグイン |
| 設定 | 不要（プラグインインストールで有効化） |
| 認証 | Figma アカウントでのログイン |

### 5. cursor-ide-browser

Cursor 内蔵ブラウザを操作し、Web アプリのテストや UI 確認を AI 経由で行う。

| 項目 | 内容 |
|------|------|
| 提供元 | Cursor 組み込み |
| 設定 | 不要 |
| 主な用途 | ページ遷移、要素クリック、フォーム入力、スクリーンショット取得 |

---

## 環境

| 項目 | 内容 |
|------|------|
| Node.js | v20 以上（LTS 推奨） |
| 管理 | nvm 推奨 |

Node.js のバージョン更新（nvm 利用時）:

```bash
nvm install --lts
```

## トラブルシューティング

### MCP サーバーが起動しない

1. Cursor を完全に終了して再起動
2. `Cursor Settings > MCP` で各サーバーのステータスを確認
3. ツールリストのリフレッシュボタンを押す

### `npx` が見つからない

ターミナルで `node -v` を確認。nvm を使っている場合は新しいターミナルで実行する。

```bash
node -v
npx -v
```

### Context7 で制限に達した

無料枠は月 1,000 回。制限後は 1 日 20 回のボーナスコール付与。Pro プラン（$10/月）で 5,000 回に拡張可能。※ 最新の制限・料金は [context7.com](https://context7.com) を参照。
