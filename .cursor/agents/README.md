# Agents

`.cursor/agents/` は、このワークスペース専用の Agent 定義や補助設定を置く場所。

## 用途

- プロジェクト固有の Agent 定義を追加するときに使う
- ルールファイルだけでは表現しにくい実行単位の役割分担をまとめる
- 追加した Agent から参照する資料や補助ファイルの置き場を明確にする

## 運用方針

- 役割ごとにファイルやサブディレクトリを分ける
- 名前だけでは役割が分からない Agent は作らない
- 永続的な行動規約は `../rules/README.md` から辿れる `rules/` 配下に置き、Agent 側には実行目的を置く
- MCP やスクリプトに依存する Agent は、対応する `../Document/MCP.md` または `../scripts/README.md` への参照を添える

## 関連

- 全体索引: `../README.md`
- MCP 設定: `../Document/MCP.md`
- 共有ルール: `../rules/README.md`
- 補助スクリプト: `../scripts/README.md`
