# 明日の一手メモ — MASTER

## Status
M03 SALES READY EXECUTION
Branch: `zero/m03-sales-ready`
Base: `main@bac5757d5ef4bfcb518453ef5f30ab57fb53a2df`
Current decision: TECH_FIX_REQUIRED before SALES READY.

## Product core
仕事終わりに「明日やる具体的な一手」を決めて残し、翌朝の迷いを減らす。P02「一手箱」とは別商品。機能追加で巨大ToDoアプリ化しない。

## Existing implementation
- Single-file HTML app: `index.html` / duplicate `genba-memo-3.html`
- Local-first storage via localStorage
- Backup export/import implemented
- Onboarding implemented
- Work / field mode implemented
- History/calendar/morning review implemented

## Sales gates
1. Technical QA
2. M03-specific storage/cache/PWA namespace
3. Static web manifest + valid same-origin service worker
4. Mobile/offline/persistence/export/import QA
5. Market/competition/price
6. LP/FAQ/privacy/terms/commerce disclosure/refund/support
7. P02 collision audit
8. Final sales audit
9. Owner approval for publication/sales/payment/main merge

## Price decision
Recommended launch price: ¥500 one-time purchase. No subscription for v1.

## Non-goals
- Team task management
- Project management
- AI planning
- Cloud sync unless independently justified later
- P02 feature duplication

## Required owner-only information
Before public sale, fill legal seller identity/contact/address/payment/delivery fields required by the selected checkout/store and Japanese law.

## Current blocker
See `TECH_FIX_REQUIRED.md`.
