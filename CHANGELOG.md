# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2024-10-09

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.4`](#nekoton_repository---v0370-dev4)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.4`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.4

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: update props for seed (#12).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-342): gql transport params.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-10-03

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.3`](#nekoton_repository---v0370-dev3)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.3`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: transport usage (#104).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.3

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: transport usage (#104).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: removing seed name (#82).
 - **FEAT**: ntp time (#84).
 - **FEAT**(EWM-326): remove account scan on network change; refactor ton/token wallet repositories;.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-09-23

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.2`](#nekoton_repository---v0370-dev2)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.2`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.2

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: remove redundant `updateSeedName` method call.
 - **FIX**: update adding seed with name (#64).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FEAT**: ntp time (#84).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-09-19

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.1`](#nekoton_repository---v0370-dev1)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.1`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: ntp time (#84).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.1

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: ntp time (#84).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-09-17

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.37.0-dev.0`](#nekoton_repository---v0370-dev0)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.37.0-dev.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: ntp time (#84).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.37.0-dev.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: removing seed name (#82).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: add keys sorting by accound id (#80).
 - **FEAT**: seed metadata (#120).
 - **FEAT**: ntp time (#84).
 - **FEAT**: derive key & update dependencies (#118).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: update transaction fields (#43).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-09-17

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.36.0`](#nekoton_repository---v0360)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.36.0`

---

#### `nekoton_repository` - `v0.36.0`

## 0.36.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2024-08-21

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.8`](#nekoton_repository---v0360-dev8)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.8`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: update token wallet (#39).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.8

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: update token wallet (#39).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-31

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.7`](#nekoton_repository---v0360-dev7)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.7`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: update token wallet (#39).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.7

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: logging version.
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add `simulateTransactionTree` method.
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: update token wallet (#39).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-29

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.6`](#nekoton_repository---v0360-dev6)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.6`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: logging version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.6

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: logging version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-26

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.5`](#nekoton_repository---v0360-dev5)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.5`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: logging version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.5

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: logging version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: use `estimateMinAttachedAmount`.
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-22

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.4`](#nekoton_repository---v0360-dev4)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.4`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: logging version.
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.4

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: logging version.
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-02

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.3`](#nekoton_repository---v0360-dev3)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.3`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: logging version.
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.3

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: logging version.
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-02

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.2`](#nekoton_repository---v0360-dev2)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.2`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: logging version.
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.2

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: logging version.
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update props for seed (#12).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-02

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.1`](#nekoton_repository---v0360-dev1)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.1`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.1

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FIX**: flutter_nekoton_bridge version.
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add logging subscriptions (#37).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-07-02

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.36.0-dev.0`](#nekoton_repository---v0360-dev0)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.36.0-dev.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add TonWalletRepository (#22).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.36.0-dev.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add TonWalletRepository (#22).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2024-05-14

### Changes

---

Packages with breaking changes:

- [`nekoton_repository` - `v0.35.1`](#nekoton_repository---v0351)

Packages with other changes:

- There are no other changes in this release.

---

#### `nekoton_repository` - `v0.35.1`

- **REFACTOR**: updating dependency package versions.

## 0.35.1

> Note: This release has breaking changes.

- **REFACTOR**: updating dependency package versions.


## 2023-12-06

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.35.0`](#nekoton_repository---v0350)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.35.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add TonWalletRepository (#22).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.35.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: transport usage (#104).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: subscribing for external wallets (#106).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add TonWalletRepository (#22).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-12-06

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.34.0`](#nekoton_repository---v0340)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.34.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: transport usage (#104).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: seed detail (#4).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add local custodians getter (#35).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.34.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: transport usage (#104).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: seed detail (#4).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add local custodians getter (#35).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-11-18

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.33.0`](#nekoton_repository---v0330)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.33.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: seed detail (#4).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add local custodians getter (#35).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.33.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: bump bridge (#100).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bumpb bridge (#102).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: seed detail (#4).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add local custodians getter (#35).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-11-15

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.32.0`](#nekoton_repository---v0320)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.32.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bump bridge (#100).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.32.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: methods to account (#96).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: bump bridge (#100).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: ntp time (#84).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-11-14

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.31.0`](#nekoton_repository---v0310)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.31.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.31.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
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
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: add stack to logger (#98).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-11-13

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.30.0`](#nekoton_repository---v0300)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.30.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.30.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: methods to account (#96).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-11-13

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.29.0`](#nekoton_repository---v0290)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.29.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.29.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add multiple tokens and update transaction (#94).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: ntp time (#84).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: seed detail (#4).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-11-02

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.28.0`](#nekoton_repository---v0280)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.28.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add send unawaited version (#70).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add cancellable operation (#32).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).

## 0.28.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: add send unawaited version (#70).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add cancellable operation (#32).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).
 - **BREAKING** **CHANGE**: rework subscription logic, now TonWalletState & TokenWalletState available (#92).


## 2023-10-26

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.27.0`](#nekoton_repository---v0270)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.27.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add send unawaited version (#70).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add cancellable operation (#32).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.27.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update props for seed (#12).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: allow subscribing multiple tokens at time (#90).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add send unawaited version (#70).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: ntp time (#84).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add cancellable operation (#32).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-10-06

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.26.0`](#nekoton_repository---v0260)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.26.0`

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: ntp time (#84).
 - **FEAT**: bump bridge version (#72).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.26.0

> Note: This release has breaking changes.

 - **REFACTOR**: updateClockOffset takes Duration instead of int (#86).
 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: ntp time (#84).
 - **FEAT**: bump bridge version (#72).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-10-02

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.25.0`](#nekoton_repository---v0250)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.25.0`

---

#### `nekoton_repository` - `v0.25.0`

## 0.25.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2023-09-29

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.25.0-dev.0`](#nekoton_repository---v0250-dev0)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.25.0-dev.0`

 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: ntp time (#84).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.25.0-dev.0

> Note: This release has breaking changes.

 - **FIX**: update props for seed (#12).
 - **FIX**: removing seed name (#82).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: ntp time (#84).
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
 - **FEAT**: seed detail (#4).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-27

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.24.0`](#nekoton_repository---v0240)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.24.0`

 - **FIX**: update props for seed (#12).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: removing seed name (#82).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.24.0

> Note: This release has breaking changes.

 - **FIX**: update props for seed (#12).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: removing seed name (#82).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-26

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.23.0`](#nekoton_repository---v0230)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.23.0`

 - **FIX**: update props for seed (#12).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.23.0

> Note: This release has breaking changes.

 - **FIX**: update props for seed (#12).
 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: add keys sorting by accound id (#80).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FEAT**: update bridge and replace jrpc transport (#59).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: implement GenericContractRepository (#61).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update mapping external accounts (#58).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: seed detail (#4).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add registering currency after transport update (#30).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-19

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.22.0`](#nekoton_repository---v0220)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.22.0`

 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.22.0

> Note: This release has breaking changes.

 - **FIX**: contract state changed stream (#74).
 - **FIX**: added loading accounts after transport changed (#77).
 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-14

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.21.0`](#nekoton_repository---v0210)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.21.0`

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.21.0

> Note: This release has breaking changes.

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: revert JRPC (#75).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-12

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.20.0`](#nekoton_repository---v0200)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.20.0`

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.20.0

> Note: This release has breaking changes.

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: bump bridge version (#72).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-11

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.19.0`](#nekoton_repository---v0190)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.19.0`

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.19.0

> Note: This release has breaking changes.

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add send unawaited version (#70).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-08

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.18.0`](#nekoton_repository---v0180)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.18.0`

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.18.0

> Note: This release has breaking changes.

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update bridge, add staking info, add updating contracts after transport changed (#68).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-09-01

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.17.0`](#nekoton_repository---v0170)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.17.0`

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.17.0

> Note: This release has breaking changes.

 - **FIX**: add GenericContract to NekotonRepository (#65).
 - **FIX**: update adding seed with name (#64).
 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add seed list change hooks (#66).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-30

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.16.0`](#nekoton_repository---v0160)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.16.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.16.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
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
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-28

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.15.0`](#nekoton_repository---v0150)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.15.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.15.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update TonWalletMultisigPendingTransaction (#56).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-23

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.14.0`](#nekoton_repository---v0140)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.14.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.14.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update subscriptions. Add TonWallet test. Add TokenWallet test (#53).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-16

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.13.0`](#nekoton_repository---v0130)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.13.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.13.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-11

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.12.0`](#nekoton_repository---v0120)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.12.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.12.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-08

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.11.0`](#nekoton_repository---v0110)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.11.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.11.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-08-02

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.10.0`](#nekoton_repository---v0100)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.10.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.10.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update transaction fields (#43).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-29

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.9.0`](#nekoton_repository---v090)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.9.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.9.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-28

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.8.0`](#nekoton_repository---v080)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.8.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.8.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: update token wallet (#39).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-26

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.7.0`](#nekoton_repository---v070)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.7.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.7.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add logging subscriptions (#37).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-24

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.6.0`](#nekoton_repository---v060)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.6.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.6.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add local custodians getter (#35).
 - **FEAT**: replace Fixed to BigInt (#34).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-20

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.5.0`](#nekoton_repository---v050)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.5.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.5.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add cancellable operation (#32).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-19

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.4.0`](#nekoton_repository---v040)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.4.0`

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.4.0

> Note: This release has breaking changes.

 - **FIX**: deleting pending transaction (#28).
 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add registering currency after transport update (#30).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.3.0`](#nekoton_repository---v030)

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.3.0`

---

#### `nekoton_repository` - `v0.3.0`

## 0.3.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2023-07-18

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.3.0-dev.0`](#nekoton_repository---v030-dev0)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.3.0-dev.0`

 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.3.0-dev.0

> Note: This release has breaking changes.

 - **FIX**: change interface to pure class (#26).
 - **FIX**: update props for seed (#12).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-18

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.2.0`](#nekoton_repository---v020)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.2.0`

 - **FIX**: update props for seed (#12).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.2.0

> Note: This release has breaking changes.

 - **FIX**: update props for seed (#12).
 - **FEAT**: add transactions mapping (#24).
 - **FEAT**: add TokenWalletRepository (#23).
 - **FEAT**: add TonWalletRepository (#22).
 - **FEAT**: use flutter templates repository (#21).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-07

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.1.1`](#nekoton_repository---v011)

Packages with other changes:

 - There are no other changes in this release.

Packages graduated to a stable release (see pre-releases prior to the stable version for changelog entries):

 - `nekoton_repository` - `v0.1.1`

---

#### `nekoton_repository` - `v0.1.1`

## 0.1.1

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries.


## 2023-07-04

### Changes

---

Packages with breaking changes:

 - [`nekoton_repository` - `v0.1.1-dev.5`](#nekoton_repository---v011-dev5)

Packages with other changes:

 - There are no other changes in this release.

---

#### `nekoton_repository` - `v0.1.1-dev.5`

 - **FIX**: update props for seed (#12).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).

## 0.1.1-dev.5

> Note: This release has breaking changes.

 - **FIX**: update props for seed (#12).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).
 - **BREAKING** **REFACTOR**: add PublicKey and Address dataclasses (#14).


## 2023-07-03

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.1.1-dev.4`](#nekoton_repository---v011-dev4)

---

#### `nekoton_repository` - `v0.1.1-dev.4`

 - **FIX**: update props for seed (#12).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).

## 0.1.1-dev.4

 - **FIX**: update props for seed (#12).
 - **FEAT**: clear nekoton directly (#15).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).


## 2023-06-28

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.1.1-dev.3`](#nekoton_repository---v011-dev3)

---

#### `nekoton_repository` - `v0.1.1-dev.3`

 - **FIX**: update props for seed (#12).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).

## 0.1.1-dev.3

 - **FIX**: update props for seed (#12).
 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).


## 2023-06-28

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.1.1-dev.2`](#nekoton_repository---v011-dev2)

---

#### `nekoton_repository` - `v0.1.1-dev.2`

 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).

## 0.1.1-dev.2

 - **FEAT**: add rename method to Seed (#10).
 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).


## 2023-06-28

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.1.1-dev.1`](#nekoton_repository---v011-dev1)

---

#### `nekoton_repository` - `v0.1.1-dev.1`

 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).

## 0.1.1-dev.1

 - **FEAT**: add seed names to Seed instance (#7).
 - **FEAT**: seed detail (#4).


## 2023-06-27

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`nekoton_repository` - `v0.1.1-dev.0`](#nekoton_repository---v011-dev0)

---

#### `nekoton_repository` - `v0.1.1-dev.0`

 - **FEAT**: seed detail (#4).

## 0.1.1-dev.0

 - **FEAT**: seed detail (#4).

