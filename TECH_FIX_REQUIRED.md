# TECH_FIX_REQUIRED — M03 明日の一手メモ

## Severity
SALES BLOCKER until verified.

## 1. Service Worker registration
Current implementation creates service-worker code as a Blob URL and calls `navigator.serviceWorker.register(blobUrl)`. Service worker script URLs must resolve to valid HTTP(S) URLs and be same-origin. Replace with a static same-origin file such as `/ashita-itte-memo/sw.js` or relative `./sw.js`.

Required verification:
- registration succeeds on production HTTPS
- active worker controls app scope
- reload while offline still loads the app shell
- cache version migration does not strand old assets

## 2. Static manifest
Replace runtime Blob manifest with a repository file such as `manifest.webmanifest` and normal `<link rel="manifest" href="./manifest.webmanifest">`.

Required fields:
- name: 明日の一手メモ
- short_name: 明日の一手
- start_url scoped to this product
- display: standalone
- theme/background colors
- dedicated icons

## 3. M03 namespace isolation
Current keys are generic `genba_*` identifiers. Migrate to product-specific keys:
- `ashita_itte_memos_v1`
- `ashita_itte_routine_v1`
- `ashita_itte_mode_v1`
- `ashita_itte_onboarding_seen_v1`

Cache name:
- `ashita-itte-memo-v1`

Do not reuse P02 keys, cache names, manifest URL, app URL or service-worker scope.

Migration requirement:
- on first launch, if new key missing and old M03 `genba_*` data exists, copy old value once to new key
- never delete old data automatically during migration
- export format should include explicit schema/app id

## 4. Backup/export hardening
Existing export/import exists. Add:
- `appId: "ashita-itte-memo"`
- `schemaVersion: 1`
- import validation rejecting unrelated app exports
- malformed JSON/error handling with user-facing failure state

## 5. Offline dependency
Google Fonts is remotely imported. The core app must remain readable/functioning offline even if fonts are unavailable. Prefer system fallback or cache only if licensing/technical implementation remains simple.

## 6. Duplicate file
`genba-memo-3.html` and `index.html` are currently byte-identical. Decide one canonical entrypoint before release. Recommended: `index.html` canonical; retain duplicate only if explicitly required, otherwise remove on release branch after verification.

## Exit criteria
- mobile viewport PASS
- installability PASS on target Android Chrome
- offline cold/reload PASS after first online load
- save/restart/restore PASS
- export/import round-trip PASS
- namespace collision test with P02 PASS
- no P0/P1 sales blockers
