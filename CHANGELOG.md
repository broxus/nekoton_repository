# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2025-08-22

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v1.5.0`](#nekoton_repository---v150)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v1.5.0`

 - **BREAKING** **REFACTOR**(EWM-493): remove currencyUrl method from TransportStrategy.

## 1.5.0

> Note: This release has breaking changes.

 - **BREAKING** **REFACTOR**(EWM-493): remove currencyUrl method from TransportStrategy.


## 2025-08-15

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.4.0`](#nekoton_repository---v140)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v1.4.0`

---

#### `nekoton_repository` - `v1.4.0`

## 1.4.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2025-08-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.4.0-dev.2`](#nekoton_repository---v140-dev2)

---

#### `nekoton_repository` - `v1.4.0-dev.2`

## 1.4.0-dev.2


## 2025-08-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.4.0-dev.1`](#nekoton_repository---v140-dev1)

---

#### `nekoton_repository` - `v1.4.0-dev.1`

## 1.4.0-dev.1


## 2025-07-23

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.4.0-dev.0`](#nekoton_repository---v140-dev0)

---

#### `nekoton_repository` - `v1.4.0-dev.0`

 - **FEAT**: ledger.

## 1.4.0-dev.0

 - **FEAT**: ledger.


## 2025-07-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.3.3`](#nekoton_repository---v133)

---

#### `nekoton_repository` - `v1.3.3`

 - **FIX**: implement read-write mutex for token wallet and ton wallet subscriptions.

## 1.3.3

 - **FIX**: implement read-write mutex for token wallet and ton wallet subscriptions.


## 2025-07-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.3.2`](#nekoton_repository---v132)

---

#### `nekoton_repository` - `v1.3.2`

 - **FIX**: fix & simplify multisig transaction mapping;.

## 1.3.2

 - **FIX**: fix & simplify multisig transaction mapping;.


## 2025-06-25

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.3.1`](#nekoton_repository---v131)

---

#### `nekoton_repository` - `v1.3.1`

 - **REFACTOR**: migrate to `freezed v3` (#222).

## 1.3.1

 - **REFACTOR**: migrate to `freezed v3` (#222).


## 2025-06-24

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.3.0`](#nekoton_repository---v130)

---

#### `nekoton_repository` - `v1.3.0`

 - **FIX**: restart polling after transport update.
 - **FEAT**(EWM-528): enhance token wallet functionality with currency conversion and symbol extension.

## 1.3.0

 - **FIX**: restart polling after transport update.
 - **FEAT**(EWM-528): enhance token wallet functionality with currency conversion and symbol extension.


## 2025-06-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.2.0`](#nekoton_repository---v120)

---

#### `nekoton_repository` - `v1.2.0`

 - **REFACTOR**: make `defaultConfig` static.
 - **FIX**: restart polling after transport update.
 - **FEAT**: add `PollingConfig`.

## 1.2.0

 - **REFACTOR**: make `defaultConfig` static.
 - **FIX**: restart polling after transport update.
 - **FEAT**: add `PollingConfig`.


## 2025-06-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v1.1.0`](#nekoton_repository---v110)

---

#### `nekoton_repository` - `v1.1.0`

 - **FEAT**: add pause and resume functionality in repositories; handle `TimeoutException` when polling is paused.

## 1.1.0

 - **FEAT**: add pause and resume functionality in repositories; handle `TimeoutException` when polling is paused.


## 2025-06-05

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v1.0.0`](#nekoton_repository---v100)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v1.0.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: update flutter_nekoton_bridge to version 2.9.2; format & analyze;.
 - **FIX**(EWM-513): enhance key derivation process by checking existing keys and filtering inactive accounts.
 - **FIX**: add error handling for simulateTransactionTree.
 - **FIX**(EWM-508): add NotExistingContract model to fix broken contract state.
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: update exports.
 - **FIX**: export utils.
 - **FIX**: reset changelog.
 - **FIX**: allow 12-word seed with custom mnemonic type.
 - **FIX**: make mnemonicType parameter optional in addSeed method and update dependencies.
 - **FIX**(SPARX-FQ): enable synchronous behavior for transport subject in TransportRepositoryImpl.
 - **FIX**(SPARX-2A): clone contract list before updating subscriptions to prevent modification during iteration.
 - **FIX**: remove gqlConnection parameter from JettonTokenWallet subscription method.
 - **FIX**: remove gqlConnection param (#178).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.5.0-dev.1.
 - **FIX**: u64 to u128 for balance (#174).
 - **FIX**: update value for balance (#172).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: bump bridge (#100).
 - **FIX**: tests.
 - **FIX**: removing seed name (#82).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: `_getTip422NftJson` collection address.
 - **FIX**: attached amount calc.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: export `cached_contract_state_provider`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: seed detail (#4).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-472): add `triggerDerivingKeys` method and use it in `addSeed`.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add walletsMapStream to expose wallet states as a map.
 - **FEAT**(EWM-505): improve `triggerDerivingKeys`; add `SeedKeyRepository` tests;.
 - **FEAT**(EWM-508): add explicit exception determines that contract doesn't exists (#203).
 - **FEAT**: add IgnoreTransactionTreeSimulationError model and integrate into TonWalletRepository.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `unsubscribeAllContracts` method.
 - **FEAT**(EWM-517): add ABI loader, and implement cached contract state provider.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**(EWM-517): implement nft repository.
 - **FEAT**(EWM-517): add tests for NftRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update FileMetadata to handle both 'mime_type' and 'mimetype' keys.
 - **FEAT**: update deps; `await transport.dispose().
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 1.0.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: update flutter_nekoton_bridge to version 2.9.2; format & analyze;.
 - **FIX**(EWM-513): enhance key derivation process by checking existing keys and filtering inactive accounts.
 - **FIX**: add error handling for simulateTransactionTree.
 - **FIX**(EWM-508): add NotExistingContract model to fix broken contract state.
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: update exports.
 - **FIX**: export utils.
 - **FIX**: reset changelog.
 - **FIX**: allow 12-word seed with custom mnemonic type.
 - **FIX**: make mnemonicType parameter optional in addSeed method and update dependencies.
 - **FIX**(SPARX-FQ): enable synchronous behavior for transport subject in TransportRepositoryImpl.
 - **FIX**(SPARX-2A): clone contract list before updating subscriptions to prevent modification during iteration.
 - **FIX**: remove gqlConnection parameter from JettonTokenWallet subscription method.
 - **FIX**: remove gqlConnection param (#178).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.5.0-dev.1.
 - **FIX**: u64 to u128 for balance (#174).
 - **FIX**: update value for balance (#172).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: bump bridge (#100).
 - **FIX**: tests.
 - **FIX**: removing seed name (#82).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: `_getTip422NftJson` collection address.
 - **FIX**: attached amount calc.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: export `cached_contract_state_provider`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: seed detail (#4).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-472): add `triggerDerivingKeys` method and use it in `addSeed`.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add walletsMapStream to expose wallet states as a map.
 - **FEAT**(EWM-505): improve `triggerDerivingKeys`; add `SeedKeyRepository` tests;.
 - **FEAT**(EWM-508): add explicit exception determines that contract doesn't exists (#203).
 - **FEAT**: add IgnoreTransactionTreeSimulationError model and integrate into TonWalletRepository.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `unsubscribeAllContracts` method.
 - **FEAT**(EWM-517): add ABI loader, and implement cached contract state provider.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**(EWM-517): implement nft repository.
 - **FEAT**(EWM-517): add tests for NftRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update FileMetadata to handle both 'mime_type' and 'mimetype' keys.
 - **FEAT**: update deps; `await transport.dispose().
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-06-05

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.72.0`](#nekoton_repository---v0720)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.72.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: update flutter_nekoton_bridge to version 2.9.2; format & analyze;.
 - **FIX**(EWM-513): enhance key derivation process by checking existing keys and filtering inactive accounts.
 - **FIX**: add error handling for simulateTransactionTree.
 - **FIX**(EWM-508): add NotExistingContract model to fix broken contract state.
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: update exports.
 - **FIX**: export utils.
 - **FIX**: reset changelog.
 - **FIX**: allow 12-word seed with custom mnemonic type.
 - **FIX**: make mnemonicType parameter optional in addSeed method and update dependencies.
 - **FIX**(SPARX-FQ): enable synchronous behavior for transport subject in TransportRepositoryImpl.
 - **FIX**(SPARX-2A): clone contract list before updating subscriptions to prevent modification during iteration.
 - **FIX**: remove gqlConnection parameter from JettonTokenWallet subscription method.
 - **FIX**: remove gqlConnection param (#178).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.5.0-dev.1.
 - **FIX**: u64 to u128 for balance (#174).
 - **FIX**: update value for balance (#172).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: bump bridge (#100).
 - **FIX**: tests.
 - **FIX**: removing seed name (#82).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: `_getTip422NftJson` collection address.
 - **FIX**: attached amount calc.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: export `cached_contract_state_provider`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: seed detail (#4).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-472): add `triggerDerivingKeys` method and use it in `addSeed`.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add walletsMapStream to expose wallet states as a map.
 - **FEAT**(EWM-505): improve `triggerDerivingKeys`; add `SeedKeyRepository` tests;.
 - **FEAT**(EWM-508): add explicit exception determines that contract doesn't exists (#203).
 - **FEAT**: add IgnoreTransactionTreeSimulationError model and integrate into TonWalletRepository.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `unsubscribeAllContracts` method.
 - **FEAT**(EWM-517): add ABI loader, and implement cached contract state provider.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**(EWM-517): implement nft repository.
 - **FEAT**(EWM-517): add tests for NftRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update FileMetadata to handle both 'mime_type' and 'mimetype' keys.
 - **FEAT**: update deps; `await transport.dispose().
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.72.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: update flutter_nekoton_bridge to version 2.9.2; format & analyze;.
 - **FIX**(EWM-513): enhance key derivation process by checking existing keys and filtering inactive accounts.
 - **FIX**: add error handling for simulateTransactionTree.
 - **FIX**(EWM-508): add NotExistingContract model to fix broken contract state.
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: update exports.
 - **FIX**: export utils.
 - **FIX**: reset changelog.
 - **FIX**: allow 12-word seed with custom mnemonic type.
 - **FIX**: make mnemonicType parameter optional in addSeed method and update dependencies.
 - **FIX**(SPARX-FQ): enable synchronous behavior for transport subject in TransportRepositoryImpl.
 - **FIX**(SPARX-2A): clone contract list before updating subscriptions to prevent modification during iteration.
 - **FIX**: remove gqlConnection parameter from JettonTokenWallet subscription method.
 - **FIX**: remove gqlConnection param (#178).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.5.0-dev.1.
 - **FIX**: u64 to u128 for balance (#174).
 - **FIX**: update value for balance (#172).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: bump bridge (#100).
 - **FIX**: tests.
 - **FIX**: removing seed name (#82).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: `_getTip422NftJson` collection address.
 - **FIX**: attached amount calc.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: export `cached_contract_state_provider`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: seed detail (#4).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-472): add `triggerDerivingKeys` method and use it in `addSeed`.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add walletsMapStream to expose wallet states as a map.
 - **FEAT**(EWM-505): improve `triggerDerivingKeys`; add `SeedKeyRepository` tests;.
 - **FEAT**(EWM-508): add explicit exception determines that contract doesn't exists (#203).
 - **FEAT**: add IgnoreTransactionTreeSimulationError model and integrate into TonWalletRepository.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `unsubscribeAllContracts` method.
 - **FEAT**(EWM-517): add ABI loader, and implement cached contract state provider.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**(EWM-517): implement nft repository.
 - **FEAT**(EWM-517): add tests for NftRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update FileMetadata to handle both 'mime_type' and 'mimetype' keys.
 - **FEAT**: update deps; `await transport.dispose().
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).
