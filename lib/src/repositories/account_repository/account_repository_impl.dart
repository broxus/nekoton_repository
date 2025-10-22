import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Implementation of AccountRepository.
/// Usage
/// ```
/// class NekotonRepository with AccountRepositoryImpl {}
/// ```
mixin AccountRepositoryImpl on TransportRepository
    implements AccountRepository {
  /// Getter of nekoton's storage
  AccountsStorage get accountsStorage;

  /// Getter of nekoton's storage
  KeyStore get keyStore;

  NekotonStorageRepository get storageRepository;

  @override
  Future<Address> addAccount(AccountToAdd account) =>
      accountsStorage.addAccount(account);

  @override
  Future<List<Address>> addAccounts(List<AccountToAdd> accounts) =>
      accountsStorage.addAccounts(accounts);

  @override
  Future<void> addExternalAccount({
    required Address address,
    PublicKey? publicKey,
    String? name,
  }) async {
    if (currentTransport.transport.disposed) return;

    final custodians = await TonWallet.getWalletCustodians(
      transport: currentTransport.transport,
      address: address,
    );

    var isCustodian = false;
    final externalAccounts = storageRepository.externalAccounts;
    final publicKeys = (publicKey == null
            ? keyStore.keys.map((e) => e.publicKey)
            : [publicKey])
        .where(custodians.contains);

    for (final publicKey in publicKeys) {
      if (externalAccounts[publicKey]?.contains(address) ?? false) continue;

      // Check if this account is part of publicKey
      final account = accountsStorage.accounts.firstWhereOrNull(
        (e) => e.address == address,
      );

      if (account == null) {
        final existingWalletInfo = await TonWallet.getExistingWalletInfo(
          transport: currentTransport.transport,
          address: address,
        );

        await addAccount(
          AccountToAdd(
            name: name ??
                GetIt.instance<NekotonRepository>()
                    .generateDefaultAccountName(publicKey) ??
                currentTransport.defaultAccountName(
                  existingWalletInfo.walletType,
                ),
            publicKey: publicKey,
            contract: existingWalletInfo.walletType,
            workchain: existingWalletInfo.address.workchain,
            explicitAddress: address,
          ),
        );
      }

      await storageRepository.addExternalAccount(
        publicKey: publicKey,
        address: address,
      );

      isCustodian = true;
    }

    if (!isCustodian) throw Exception('Is not custodian');
  }

  @override
  Future<void> removeAccounts(List<KeyAccount> accounts) {
    final local = <KeyAccount>[];
    final external = <KeyAccount>[];
    for (final account in accounts) {
      if (account.isExternal) {
        external.add(account);
      } else {
        local.add(account);
      }
    }

    return Future.wait([
      removeLocalAccounts(local),
      removeExternalAccounts(external),
    ]);
  }

  @override
  Future<void> removeLocalAccounts(List<KeyAccount> accounts) async {
    if (accounts.isEmpty) return;

    assert(
      accounts.every((a) => !a.isExternal),
      'All accounts must be local, to remove external use, '
      '$removeExternalAccounts',
    );

    final addresses = accounts.map((e) => e.account.address).toList();
    await storageRepository.showAccounts(addresses);
    await accountsStorage.removeAccounts(addresses);
  }

  /// Removing external account is quite complicated because first of all,
  /// we should remove external account mark from storage by its public key.
  /// Then we should check, if this account exists for any other public key,
  /// because one of them is custodian, another one is real owner.
  /// Then, if there is no other owners of this account, we remove it.
  @override
  Future<void> removeExternalAccounts(List<KeyAccount> accounts) async {
    if (accounts.isEmpty) return;

    assert(
      accounts.every((a) => a.isExternal),
      'All accounts must be external, to remove local use, '
      '$removeLocalAccounts',
    );

    final localKeys = keyStore.keys.map((e) => e.publicKey).toList();

    final externalAccounts = <PublicKey, List<Address>>{};
    for (final account in accounts) {
      externalAccounts[account.publicKey] = [
        ...?externalAccounts[account.publicKey],
        account.account.address,
      ];
    }

    for (final entry in externalAccounts.entries) {
      await storageRepository.removeExternalAccounts(
        publicKey: entry.key,
        addresses: entry.value,
      );
    }

    final removeFromLocal = <KeyAccount>[];
    final updatedExternal = storageRepository.externalAccounts.values.expand(
      (e) => e,
    );
    for (final account in accounts) {
      final isStillExternal = updatedExternal.contains(account.account.address);
      final isLocal = localKeys.contains(account.account.publicKey);
      if (!isStillExternal && !isLocal) {
        removeFromLocal.add(account);
      }
    }

    final addresses = removeFromLocal.map((e) => e.account.address).toList();
    await storageRepository.showAccounts(addresses);
    await accountsStorage.removeAccounts(addresses);
  }

  @override
  Future<void> renameAccount(Address address, String newName) =>
      accountsStorage.renameAccount(address, newName);

  @override
  Future<void> addTokenWallet({
    required Address address,
    required Address rootTokenContract,
  }) =>
      accountsStorage.addTokenWallet(
        address: address,
        rootTokenContract: rootTokenContract,
        networkGroup: currentTransport.transport.group,
      );

  @override
  Future<void> addTokenWallets({
    required Address address,
    required List<Address> rootTokenContracts,
  }) =>
      accountsStorage.addTokenWallets(
        address: address,
        rootTokenContracts: rootTokenContracts,
        networkGroup: currentTransport.transport.group,
      );

  @override
  Future<void> removeTokenWallet({
    required Address address,
    required Address rootTokenContract,
  }) =>
      accountsStorage.removeTokenWallet(
        address: address,
        rootTokenContract: rootTokenContract,
        networkGroup: currentTransport.transport.group,
      );
  @override
  Future<void> removeTokenWallets({
    required Address address,
    required List<Address> rootTokenContracts,
  }) =>
      accountsStorage.removeTokenWallets(
        address: address,
        rootTokenContracts: rootTokenContracts,
        networkGroup: currentTransport.transport.group,
      );
}
