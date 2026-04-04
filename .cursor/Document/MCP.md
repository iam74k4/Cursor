# MCP（Model Context Protocol）利用方法

## 概要

MCP は、AI に外部ツールやデータソースへのアクセスを提供するオープンプロトコル。
Cursor では Composer の Agent モードで MCP ツールが利用できる。

## 設定

| 項目 | パス |
|------|------|
| グローバル設定 | `~/.cursor/mcp.json` |
| プロジェクト単位 | `.cursor/mcp.json`（プロジェクトルート） |
| スクリプト | `.cursor/scripts/` |

## 導入済み MCP サーバー

### 1. Context7

最新のライブラリドキュメント・コード例を AI に提供。

| 項目 | 内容 |
|------|------|
| 接続方式 | リモート（URL） |
| Node.js | 不要 |
| 無料枠 | 月 1,000 API コール |

**使い方**: プロンプトに `use context7` を追加。

```
React Query でクエリを無効化するには？ use context7
use context7 with /vercel/next.js for app router setup
```

---

### 2. GitHub

Issue の作成・管理・検索など。

| 項目 | 内容 |
|------|------|
| 接続方式 | リモート（推奨） |
| 認証 | GitHub PAT（用途に応じたスコープ） |

**主なツール**: `issue_create`, `issue_update`, `issue_list`, `issue_search`, `issue_comment`, `create_pull_request` など

**推奨設定**: `.cursor/mcp.json` に GitHub MCP を設定し、PAT はローカルファイルにのみ保存する。`.cursor/mcp.json` は Git 管理対象に含めない。

```json
{
  "mcpServers": {
    "github": {
      "url": "https://api.githubcopilot.com/mcp/",
      "headers": {
        "Authorization": "Bearer YOUR_GITHUB_PAT"
      }
    }
  }
}
```

1. GitHub で Personal Access Token を作成する
2. `.cursor/mcp.json` の `YOUR_GITHUB_PAT` を置き換える
3. Cursor を完全に再起動する

`repo` 系操作を使うなら、必要な repository 権限を含む PAT を使う。

---

### 3. draw.io

Draw.io（diagrams.net）を AI から操作して図を作成・編集。

| 項目 | 内容 |
|------|------|
| 接続方式 | ローカル（ラッパースクリプト経由） |
| Node.js | v20 以上 |
| OS | macOS / Linux、または Windows + WSL / Git Bash |
| エディタ URL | http://localhost:3000/ |

**使い方**

1. Cursor を再起動して MCP を読み込む
2. ブラウザで http://localhost:3000/ を開く
3. プロンプトで図の作成・編集を依頼する

**ルール**: `.cursor/rules/MCP/drawio-rules.mdc` を参照

---

## プラグイン経由の MCP

`mcp.json` での設定不要。プラグインインストールで有効化。

| サーバー | 用途 |
|----------|------|
| Figma | デザインファイル読み取り、Code Connect |
| cursor-ide-browser | ページ遷移、クリック、フォーム入力、スクリーンショット |

---

## スクリプト

### drawio-mcp.sh

**パス**: `.cursor/scripts/drawio-mcp.sh`

**役割**: drawio MCP 起動前に既存プロセスを終了し、ポート競合を防ぐ。

`drawio-mcp.sh` は `bash`、`pkill`、`lsof`、`ps` を使うため、Windows では WSL か Git Bash など Unix 系コマンドが使える環境を前提とする。

1. `pkill` で drawio-mcp-server を終了
2. ポート 3000・3333 の drawio 関連プロセスのみ終了
3. 2 秒待機
4. drawio-mcp-server を起動

**mcp.json 参照**: `~/.cursor/mcp.json` の drawio の `command` で指定。

---

## 環境

| 項目 | 内容 |
|------|------|
| Node.js | v20 以上（LTS 推奨） |
| 管理 | nvm 推奨 |

---

## トラブルシューティング

### MCP サーバーが起動しない

1. Cursor を完全に終了して再起動
2. `Cursor Settings > MCP` でステータス確認
3. ツールリストのリフレッシュボタンを押す
4. GitHub MCP の場合は `.cursor/mcp.json` の PAT 設定を見直す

### draw.io がエラーになる

1. **手動起動でエラー確認**
   ```bash
   npx -y drawio-mcp-server --editor --http-port 3000
   ```

2. **nvm 利用時**: `mcp.json` の drawio に `env.PATH` を追加（nvm の node パスを指定）

3. **代替**: Mermaid 図で代用可能

### npx が見つからない

```bash
node -v
npx -v
```

nvm 利用時は新しいターミナルで実行する。

---

## 参考リンク

- [Context7](https://context7.com/docs/overview)
- [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)
- [lgazo/drawio-mcp-server](https://github.com/lgazo/drawio-mcp-server)
