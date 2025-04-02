# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2025-04-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.59.0`](#nekoton_repository---v0590)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.59.0`

---

#### `nekoton_repository` - `v0.59.0`

## 0.59.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2025-03-25

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.59.0-dev.1`](#nekoton_repository---v0590-dev1)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.59.0-dev.1`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update value for balance (#172).
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
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: bump bridge (#100).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: TON support (#149).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-472): add `triggerDerivingKeys` method and use it in `addSeed`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: ntp time (#84).
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
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
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**(EWM-342): gql transport params.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.59.0-dev.1

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update value for balance (#172).
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
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: bump bridge (#100).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: TON support (#149).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-472): add `triggerDerivingKeys` method and use it in `addSeed`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: ntp time (#84).
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
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
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**(EWM-342): gql transport params.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.59.0-dev.0`](#nekoton_repository---v0590-dev0)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.59.0-dev.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update value for balance (#172).
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
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: methods to account (#96).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: transport usage (#104).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: removing seed name (#82).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: TON support (#149).
 - **FEAT**: seed detail (#4).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
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
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.59.0-dev.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update value for balance (#172).
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
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: methods to account (#96).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: transport usage (#104).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: removing seed name (#82).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.8.0-dev.0.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: TON support (#149).
 - **FEAT**: seed detail (#4).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
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
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-19

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.58.0`](#nekoton_repository---v0580)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.58.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update `flutter_nekoton_bridge`.
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
 - **FIX**: update exports.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update props for seed (#12).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: change interface to pure class (#26).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: seed detail (#4).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: TON support (#149).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
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
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.58.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update `flutter_nekoton_bridge`.
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
 - **FIX**: update exports.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update props for seed (#12).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**(EWM-484): use callbackPayload in jetton wallet transfer and upgrade flutter_nekoton_bridge to version 2.7.0.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: change interface to pure class (#26).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: seed detail (#4).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: TON support (#149).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
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
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-13

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.57.0`](#nekoton_repository---v0570)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.57.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: `isExpiredTransaction`.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: removing seed name (#82).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: update exports.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
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
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: ntp time (#84).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.57.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: `isExpiredTransaction`.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: removing seed name (#82).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: update exports.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: update props for seed (#12).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update flutter_nekoton_bridge dependency to version 2.6.0.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
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
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: ntp time (#84).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-12

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.56.0`](#nekoton_repository---v0560)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.56.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: `isExpiredTransaction`.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: update exports.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: export utils.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update props for seed (#12).
 - **FIX**: bump bridge (#100).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
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
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: ntp time (#84).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.56.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: `isExpiredTransaction`.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: update exports.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: export utils.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update props for seed (#12).
 - **FIX**: bump bridge (#100).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
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
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: ntp time (#84).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-12

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.55.0`](#nekoton_repository---v0550)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.55.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: analyze.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: export utils.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update props for seed (#12).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: removing seed name (#82).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
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
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: seed metadata (#120).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.55.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: analyze.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: export utils.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update props for seed (#12).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: removing seed name (#82).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
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
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: seed metadata (#120).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-12

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.54.0`](#nekoton_repository---v0540)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.54.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: analyze.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: reset changelog.
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
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
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: seed metadata (#120).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.54.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: analyze.
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: reset changelog.
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add NumExtension for native token conversion.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
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
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: seed metadata (#120).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-03-05

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.53.0`](#nekoton_repository---v0530)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.53.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: reset changelog.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: methods to account (#96).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: allow 12-word seed with custom mnemonic type.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: update props for seed (#12).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
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
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: derive key & update dependencies (#118).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.53.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
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
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: reset changelog.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: methods to account (#96).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: allow 12-word seed with custom mnemonic type.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FIX**: update props for seed (#12).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed detail (#4).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update `flutter_nekoton_bridge`.
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
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: update prepareTransfer method to use TonWalletTransferParams and bump flutter_nekoton_bridge to version 2.5.0-dev.3.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add mnemonicType parameter to addSeed method in SeedKeyRepository.
 - **FEAT**: derive key & update dependencies (#118).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

