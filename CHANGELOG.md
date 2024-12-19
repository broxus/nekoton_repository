# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

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

