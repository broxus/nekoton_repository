# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2025-01-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.50.0`](#nekoton_repository---v0500)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.50.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: remove duplicate errors from transaction simulation in.
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
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
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
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: revert JRPC (#75).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.50.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: remove duplicate errors from transaction simulation in.
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
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add estimateDeploymentFees method to TonWalletRepository.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed detail (#4).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
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
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: revert JRPC (#75).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-23

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.49.0`](#nekoton_repository---v0490)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.49.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: transport usage (#104).
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: removing seed name (#82).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: seed detail (#4).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
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
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: revert JRPC (#75).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.49.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: transport usage (#104).
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.1.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: removing seed name (#82).
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: seed detail (#4).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
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
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: revert JRPC (#75).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-23

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.48.0`](#nekoton_repository---v0480)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.48.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: update props for seed (#12).
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: subscribing for external wallets (#106).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: TON support (#149).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: seed metadata (#120).
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
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: bump bridge version (#72).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.48.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: update props for seed (#12).
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: update flutter_nekoton_bridge dependency to version 2.4.0.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: change interface to pure class (#26).
 - **FIX**: transport usage (#104).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: subscribing for external wallets (#106).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: TON support (#149).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: seed metadata (#120).
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
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: bump bridge version (#72).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-23

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.47.0`](#nekoton_repository---v0470)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.47.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: bumpb bridge (#102).
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
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: bump bridge (#100).
 - **FIX**: transport usage (#104).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
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
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: bump bridge version (#72).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.47.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: bumpb bridge (#102).
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
 - **FIX**: update dependencies for `flutter_nekoton_bridge` and `rxdart`.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: bump bridge (#100).
 - **FIX**: transport usage (#104).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: TON support (#149).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
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
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: bump bridge version (#72).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-23

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.46.0`](#nekoton_repository---v0460)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.46.0`

---

#### `nekoton_repository` - `v0.46.0`

## 0.46.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2025-01-21

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.46.0-dev.3`](#nekoton_repository---v0460-dev3)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.46.0-dev.3`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: analyze.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: bump bridge (#100).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: update props for seed (#12).
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: TON support (#149).
 - **FEAT**: seed metadata (#120).
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
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.46.0-dev.3

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: analyze.
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: bump bridge (#100).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: update props for seed (#12).
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: TON support (#149).
 - **FEAT**: seed metadata (#120).
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
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-20

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.46.0-dev.2`](#nekoton_repository---v0460-dev2)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.46.0-dev.2`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: bump bridge (#100).
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
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: removing seed name (#82).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
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
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.46.0-dev.2

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: bump bridge (#100).
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
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: removing seed name (#82).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: logging version.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
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
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-17

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.46.0-dev.1`](#nekoton_repository---v0460-dev1)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.46.0-dev.1`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: tests.
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
 - **FIX**: update props for seed (#12).
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: bumpb bridge (#102).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
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
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.46.0-dev.1

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: tests.
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
 - **FIX**: update props for seed (#12).
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: update `flutter_nekoton_bridge` to version ^2.3.0-dev.2.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: bumpb bridge (#102).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
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
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2025-01-17

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.46.0-dev.0`](#nekoton_repository---v0460-dev0)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.46.0-dev.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**: update props for seed (#12).
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: bumpb bridge (#102).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: TON support (#149).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
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
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.46.0-dev.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**: update props for seed (#12).
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: bumpb bridge (#102).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: TON support (#149).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: update `flutter_nekoton_bridge` (#161).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
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
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add send unawaited version (#70).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-29

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.45.0`](#nekoton_repository---v0450)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.45.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: attached amount calc.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: methods to account (#96).
 - **FIX**: update props for seed (#12).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: TON support (#149).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
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
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.45.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: attached amount calc.
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: methods to account (#96).
 - **FIX**: update props for seed (#12).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: TON support (#149).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: flutter_nekoton_bridge: ^2.2.2 (#159).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: seed metadata (#120).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `simulateTransactionTree` method.
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
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-27

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.44.0`](#nekoton_repository---v0440)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.44.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: methods to account (#96).
 - **FIX**: attached amount calc.
 - **FIX**: update props for seed (#12).
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
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
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.44.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: `preloadTransactions` args.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: add external account.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: methods to account (#96).
 - **FIX**: attached amount calc.
 - **FIX**: update props for seed (#12).
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: pause/resume `RefreshPollingQueue`; handle `onMessageSentStream` done;.
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: transport usage (#104).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: ntp time (#84).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: seed metadata (#120).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
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
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-26

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.43.0`](#nekoton_repository---v0430)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.43.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: remove redundant `updateSeedName` method call.
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
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
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
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add seed list change hooks (#66).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.43.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: remove redundant `updateSeedName` method call.
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
 - **FIX**: update `flutter_nekoton_bridge`.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
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
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add seed list change hooks (#66).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-26

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.42.0`](#nekoton_repository---v0420)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.42.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: remove redundant `updateSeedName` method call.
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
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FIX**: `preloadTransactions` args.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
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
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add seed list change hooks (#66).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.42.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: remove redundant `updateSeedName` method call.
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
 - **FIX**: rename `hours` to `expirationTime`, add description.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FIX**: `preloadTransactions` args.
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
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
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: TON support (#149).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: add seed list change hooks (#66).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.41.0`](#nekoton_repository---v0410)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.41.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: `preloadTransactions` args.
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
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
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
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.41.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: `preloadTransactions` args.
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
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
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
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.40.0`](#nekoton_repository---v0400)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.40.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: add `isTransactionsPreloaded`.
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
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
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
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.40.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: add `isTransactionsPreloaded`.
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
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: TON support (#149).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: use `estimateMinAttachedAmount`.
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
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.39.0`](#nekoton_repository---v0390)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.39.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: update props for seed (#12).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
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
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: TON support (#149).
 - **FEAT**: update deps; `await transport.dispose().
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.39.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: add `isTransactionsPreloaded`.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: update props for seed (#12).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
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
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: TON support (#149).
 - **FEAT**: update deps; `await transport.dispose().
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.38.0`](#nekoton_repository---v0380)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.38.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: contract state changed stream (#74).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: methods to account (#96).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: TON support (#149).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update deps; `await transport.dispose().
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
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add `simulateTransactionTree` method.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.38.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: contract state changed stream (#74).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: methods to account (#96).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: transport usage (#104).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: update `nekoton`; add jetton gql connection;.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: TON support (#149).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update deps; `await transport.dispose().
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
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: add `simulateTransactionTree` method.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-20

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.37.0`](#nekoton_repository---v0370)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.37.0`

---

#### `nekoton_repository` - `v0.37.0`

## 0.37.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2024-12-19

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.20`](#nekoton_repository---v0370-dev20)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.20`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: removing seed name (#82).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.20

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: `mapMultisigPendingTransactions`.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: removing seed name (#82).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-19

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.19`](#nekoton_repository---v0370-dev19)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.19`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: removing seed name (#82).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: update props for seed (#12).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: contract state changed stream (#74).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: ntp time (#84).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.19

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: analyze.
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: removing seed name (#82).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: `isExpiredTransaction`.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: update props for seed (#12).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: contract state changed stream (#74).
 - **FEAT**: preload token transactions; update `flutter_nekoton_bridge`;.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: ntp time (#84).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-16

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.18`](#nekoton_repository---v0370-dev18)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.18`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: analyze.
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: contract state changed stream (#74).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.18

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: analyze.
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: bump bridge (#100).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: contract state changed stream (#74).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-16

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.17`](#nekoton_repository---v0370-dev17)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.17`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: update props for seed (#12).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: ntp time (#84).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.17

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: attached amount calc.
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: update props for seed (#12).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: bump bridge (#100).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FEAT**: add ton wallet callbacks.
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: ntp time (#84).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: seed detail (#4).
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
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-12-04

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.16`](#nekoton_repository---v0370-dev16)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.16`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: transport usage (#104).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: update props for seed (#12).
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: removing seed name (#82).
 - **FIX**: attached amount calc.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: deleting pending transaction (#28).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.16

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: transport usage (#104).
 - **FIX**(EWM-313): update `flutter_nekoton_bridge`; fix `estimateMinAttachedAmount`;.
 - **FIX**: tests.
 - **FIX**: update props for seed (#12).
 - **FIX**: expiration time fix ci (#139).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: remove duplicate errors from transaction simulation in.
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**(EWM-346): allow legacy wallet types in `SeedList` (#126).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: removing seed name (#82).
 - **FIX**: attached amount calc.
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: methods to account (#96).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: bump bridge (#100).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: deleting pending transaction (#28).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed metadata (#120).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**(EWM-357): optimize `triggerAddingAccounts` method; add progress tracking; (#128).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-369): add token api endpoint in `TransportStrategy`.
 - **FEAT**: add `currencyApiBaseUrl` field.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: update `flutter_nekoton_bridge`; add transport http client support;.
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: add expiration time to prepareDeployWithMultipleOwners (#136).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: update deps; `await transport.dispose().
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

