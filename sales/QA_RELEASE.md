# M03 Release QA

## Current static audit
- Repository exists and is public.
- `main` has only `index.html` and duplicate `genba-memo-3.html`.
- Storage uses localStorage.
- Backup export/import exists.
- Onboarding exists.
- Existing service-worker registration uses a Blob URL and is a release blocker.
- Existing storage/cache identifiers are generic `genba_*` / `genba-memo-v1` and must be isolated for M03.

## Required functional test matrix
### Save / persistence
- create memo
- reload tab
- close/reopen browser
- relaunch installed PWA
- verify latest memo and history remain

### Export / import
- export non-empty dataset
- clear M03 test data
- import backup
- verify all fields and mode/routine values
- reject malformed JSON
- reject export from another product

### Mobile
- Android Chrome current stable
- 360px–430px viewport
- keyboard open/close
- safe-area / bottom nav
- no accidental zoom / clipped controls

### Offline
- first online load completes
- installed/loaded app then airplane mode
- reload app
- create/edit/delete memo offline
- return online without data loss

### P02 collision
Open/install both products on their intended URLs. Verify:
- different storage keys
- different service-worker scopes
- different cache names
- different manifest names/icons/start URLs
- no cross-product backup import
- no data overwrite

## Release severity
P0: data loss, cross-product overwrite, cannot launch, security/privacy contradiction
P1: offline/installability false claim, backup restore broken, core save/read broken
P2: cosmetic/non-blocking copy/layout defects

SALES READY requires P0=0 and sales-blocking P1=0.
