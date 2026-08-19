# 明日の一手メモ — Legal / Privacy Sales Foundation

> Publication draft. Seller-specific identity/contact/payment fields must be completed by the owner before sale.

## Privacy Policy draft

### 1. Basic policy
明日の一手メモは、販売版v1において、ユーザーが入力したメモを原則として利用端末側に保存するlocal-first設計を採用する。

### 2. User-entered data
アプリ内に入力した仕事・案件名、明日の一手、開始行動、準備事項その他のメモは、販売版の実装監査で別途明示されない限り、運営者のサーバーへ自動送信しない。

### 3. Backup
ユーザーがバックアップを書き出した場合、そのファイルの保存・管理はユーザーが選択した端末または保存先に依存する。

### 4. External resources
販売版で外部フォント、アクセス解析、クラッシュ解析その他の外部通信を利用する場合は、実装内容を確認し、本ポリシーへ反映する。不要な外部通信は追加しない。

### 5. Deletion
アプリ内データ削除機能およびブラウザ/端末側のサイトデータ削除によりローカルデータを削除できるようにする。削除方法は販売版FAQに明示する。

### 6. Changes
実装またはデータ取扱いが変更された場合、公開前に本ポリシーを更新する。

### 7. Contact
[OWNER_INFO_REQUIRED: support contact]

---

## Terms draft

1. 本サービスは、翌日の具体的な最初の行動を記録・確認するための補助ツールであり、成果、生産性、収益その他の結果を保証しない。
2. ユーザーは重要データについて必要に応じバックアップを行う。
3. 端末故障、OS/ブラウザのデータ消去、ユーザー操作その他によりローカルデータが失われる可能性がある。
4. 法令上制限できない責任を除き、利用に伴う間接的損害等について適用法令の範囲で責任を制限する。
5. 購入・返金・キャンセルは、購入経路のルールおよび購入前に表示する販売条件に従う。
6. 規約変更が必要な場合は、適切な方法で表示する。

---

## Specified Commercial Transactions Act / sales disclosure checklist

Before direct internet sale, complete and publish as applicable:
- 販売業者名: [OWNER_INFO_REQUIRED]
- 運営責任者: [OWNER_INFO_REQUIRED]
- 所在地: [OWNER_INFO_REQUIRED]
- 電話番号: [OWNER_INFO_REQUIRED / legally appropriate disclosure method]
- メール/問い合わせ先: [OWNER_INFO_REQUIRED]
- 販売価格: ¥500予定
- 商品代金以外の必要料金: 決済/通信等の条件を購入経路に合わせて明示
- 支払方法・支払時期: [CHECKOUT_REQUIRED]
- 提供時期: [CHECKOUT_REQUIRED]
- 返品・キャンセル・返金条件: 購入前および必要な最終確認画面で明確化
- 動作環境: release QA後に確定

Japanese internet mail-order advertising requires prescribed seller/transaction information and clear cancellation/return terms. Do not publish a checkout until this disclosure and final confirmation screen are consistent with the selected sales channel.

## Refund policy foundation
Recommended for v1: follow the selected app store/payment processor rules first; for any direct sale, state the digital-content refund/cancellation conditions clearly before purchase. Never use vague language such as '相談に応じます' as the only condition.
