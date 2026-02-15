# 監査レポート（project-workflow3 軽量化フレームワーク）

監査日: 2026-02-16
監査者: auditor (Claude Code) + Codex CLI (独立レビュー)
対象: project-workflow3（587行 → 修正後 589行）
元フレームワーク: project-workflow2（2,704行）

---

## 対象ファイル一覧（16ファイル）

| ファイル | 行数 | 役割 |
|---------|------|------|
| `CLAUDE.md` | 131 | プロジェクト共通ルール |
| `.agent/config.yml` | 47 | ロール・ツール・ワークフロー定義 |
| `.agent/pm-guide.md` | 78 | PM専用ガイド |
| `.agent/member-guide.md` | 74 | メンバー共通ガイド |
| `.agent/knowledge.md` | 30 | ナレッジベース |
| `.agent/templates/task.md` | 28 | タスクテンプレート |
| `.agent/templates/spec.md` | 29 | 仕様書テンプレート |
| `.agent/templates/report.md` | 25 | レポートテンプレート |
| `.claude/commands/pm-start.md` | 21 | PM起動コマンド |
| `.claude/commands/architect.md` | 16 | Architect起動コマンド |
| `.claude/commands/developer.md` | 18 | Developer起動コマンド |
| `.claude/commands/reviewer.md` | 13 | Reviewer起動コマンド |
| `.claude/commands/tester.md` | 16 | Tester起動コマンド |
| `scripts/run-codex.sh` | 34 | Codex CLI実行スクリプト |
| `.gitignore` | 27 | Git除外設定 |
| **合計** | **587** | |

---

## 1. 思想の保全

### [PASS] 基本思想が維持されている

| 思想 | 元 (v2) | 軽量版 (v3) | 判定 |
|------|---------|-------------|------|
| **仕様書駆動開発** | CLAUDE.md 1.1 で詳述 | CLAUDE.md 1 で明記 | 維持 |
| **TDD** | CLAUDE.md 4.1 + member-handbook 3.2 | CLAUDE.md 4 + member-guide Developer | 維持 |
| **チーム開発** (PM+メンバー) | pm-playbook + member-handbook | pm-guide + member-guide | 維持 |
| **自律テスト-修正ループ** | pm-playbook 4.4 (最大5ループ) | pm-guide 3, config.yml test_loop | 維持 |
| **E2Eテスト省略禁止** | CLAUDE.md 1.1, 4.3 | CLAUDE.md 1, 4, member-guide 3 | 維持 |
| **品質ゲート** | pm-playbook 5.1-5.4 | pm-guide 4 (テーブル形式) | 維持 |
| **ホットフィックスフロー** | pm-playbook 4.6 (詳細) | pm-guide 5 (簡潔) | 維持 |
| **日本語ドキュメント** | CLAUDE.md 1.4 | CLAUDE.md 1 | 維持 |
| **完全自律実行** | CLAUDE.md 1.1 | CLAUDE.md 1 | 維持 |

---

## 2. 整合性

### 発見した問題と修正結果

| # | 問題 | 深刻度 | 修正済? |
|---|------|--------|---------|
| 1 | ナレッジパス不整合: CLAUDE.md/member-guide/pm-guide が `.agent/knowledge/` を参照するが実体は `.agent/knowledge.md` | HIGH | **修正済** |
| 2 | Codex CLI起動方式: config.yml は `codex exec --full-auto` だが run-codex.sh は `codex --approval-mode full-auto` | HIGH | **修正済** |
| 3 | commands/*.md の参照番号: `(3.x)` と記載だが member-guide の実際のセクションは `2.` | MEDIUM | **修正済** |
| 4 | ループ回数の二重ルール: テスト-修正ループ上限5回 vs 不合格3回で担当変更 | MEDIUM | **修正済** (二段階ルールとして明文化) |
| 5 | CLAUDE.md ディレクトリ構成図で `knowledge/` が `knowledge.md` と不一致 | MEDIUM | **修正済** |

### [PASS] ファイル間の参照パスが正しい（修正後）
### [PASS] 用語・命名が統一されている

---

## 3. 網羅性

### 充足している項目
- フェーズフロー (Phase 1-5) の完全な定義
- 5ロール定義 (PM/Architect/Developer/Reviewer/Tester)
- アサインマトリクス (Claude Code vs Codex CLI)
- 品質ゲート (4段階)
- TDD原則 (RED-GREEN-REFACTOR)
- E2E必須ルール
- Codex CLI連携 (config + script)
- ワークスペース構成
- テンプレート (task/spec/report)
- ロール別コマンド定義
- Git規約
- ホットフィックスフロー
- ナレッジベース構造

### [WARN] 改善提案（必須ではないが推奨）

1. **TeamCreate/TaskCreate 等のオーケストレーション操作**
   - pm-guide.md に「TeamCreate→作業→shutdown_request→TeamDelete」の流れは記載済み
   - ただし TeamCreate/TaskCreate は Claude Code のビルトイン機能であり、フレームワーク側で詳細に定義する必要性は低い
   - 元フレームワーク (v2) でもこれらのコマンドの詳細仕様は未定義（使い方の記述のみ）
   - **判定: 現状で十分（Claude Code の機能として自明）**

2. **レビュー成果物の命名規則**
   - reviewer.md で report テンプレート使用を指示
   - ファイル命名規則（例: `REVIEW-<TASK_ID>.md`）が未固定
   - **判定: WARN（運用開始時に自然に決まるため必須ではない）**

3. **commands/*.md から run-codex.sh への導線**
   - Codex CLI 使用時の導線が commands から明示されていない
   - ただし pm-guide.md で「チームメイトが Bash で実行」と記載済み
   - **判定: WARN（pm-guide の記載で運用可能）**

---

## 4. 自己完結性

### [PASS] フレームワーク単独で運用可能

以下の要素が揃っており、新規プロジェクトを開始できる:
- `inbox/` に仕様書を置くだけで開始できるフロー
- PM起動コマンド (`/pm-start`) が全読み込みファイルを指定
- 各ロールの起動コマンドが必要ファイルを明記
- テンプレートが成果物の形式を定義
- `workspace/` がエビデンス格納先として構造化
- `scripts/run-codex.sh` で Codex CLI 連携が自動化

---

## 5. 行数制約

### [PASS] 合計行数が900行以下

| 区分 | 行数 |
|------|------|
| コアファイル (CLAUDE.md + config.yml + guides) | 330 |
| テンプレート | 82 |
| コマンド定義 | 84 |
| スクリプト + gitignore | 61 |
| ナレッジベース | 30 |
| **合計** | **587** |

元フレームワーク (2,704行) の 21.7% に圧縮。目標の 1/3 (900行) を大きく下回る。

---

## 6. 修正実施記録

以下の修正を auditor が直接実施した:

| # | 修正内容 | 対象ファイル |
|---|---------|------------|
| 1 | `.agent/knowledge/` → `.agent/knowledge.md` に統一 | CLAUDE.md (2箇所), pm-guide.md, member-guide.md (2箇所) |
| 2 | `codex --approval-mode full-auto` → `codex exec --full-auto` | scripts/run-codex.sh |
| 3 | `(3.x ロール名)` → `(2. ロール別作業手順 > ロール名)` | commands/architect.md, developer.md, reviewer.md, tester.md |
| 4 | 「不合格3回で差し戻し」→ 二段階ルール（3回担当変更 + 5回ループ上限）を明文化 | member-guide.md |
| 5 | ディレクトリ構成図の `knowledge/` → `knowledge.md` | CLAUDE.md |

---

## 最終判定

| 監査項目 | 判定 |
|---------|------|
| 基本思想の維持 | **[PASS]** |
| ファイル間参照パスの正確性 | **[PASS]** (修正後) |
| 用語・命名の統一 | **[PASS]** (修正後) |
| フレームワーク単独での運用可能性 | **[PASS]** |
| 合計行数 900行以下 | **[PASS]** (587行) |
| 改善提案 | **[WARN]** レビュー命名規則、Codex導線（必須ではない） |

### **総合判定: PASS（承認）**

修正前に5件の不整合が発見されたが、全て修正済み。
基本思想は完全に保全されており、フレームワーク単独で新規プロジェクトを開始・運用できる品質に達している。
