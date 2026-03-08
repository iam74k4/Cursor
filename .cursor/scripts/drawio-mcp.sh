#!/usr/bin/env bash
# drawio-mcp-server 起動: 既存プロセスを終了し、ポートを解放してから起動
# Cursor 終了時にプロセスが残る場合の対策

set -e

# 1. 既存の drawio-mcp-server プロセスを終了
pkill -f "drawio-mcp-server" 2>/dev/null || true

# 2. ポート 3000 (HTTP), 3333 (WebSocket) の drawio 関連プロセスのみ終了
#    （他アプリの 3000 使用を誤って終了しないため）
for port in 3000 3333; do
  for pid in $(lsof -nti:"$port" 2>/dev/null); do
    if ps -p "$pid" -o command= 2>/dev/null | grep -q drawio-mcp; then
      kill -9 "$pid" 2>/dev/null || true
    fi
  done
done

# 3. ポート解放を待つ
sleep 2

# 4. drawio-mcp-server を起動（exec でこのプロセスを置換）
exec npx -y drawio-mcp-server --editor --http-port 3000
