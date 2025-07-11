import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

const _maxDeriveKeys = 100;

/// Implementation of SeedRepository.
/// Usage
/// ```
/// class NekotonRepository with SeedRepositoryImpl {}
/// ```
mixin SeedKeyRepositoryImpl implements SeedKeyRepository {
  final _findingExistingWalletsSubject = BehaviorSubject.seeded(<String>{});
  final _findingDerivedKeysSubject = BehaviorSubject.seeded(<String>{});

  @override
  Set<String> get findingExistingWallets =>
      _findingExistingWalletsSubject.value;

  @override
  Stream<Set<String>> get findingExistingWalletsStream =>
      _findingExistingWalletsSubject.stream;

  @override
  Set<String> get findingDerivedKeys => _findingDerivedKeysSubject.value;

  @override
  Stream<Set<String>> get findingDerivedKeysStream =>
      _findingDerivedKeysSubject.stream;

  KeyStore get keyStore;

  AccountsStorage get accountsStorage;

  NekotonStorageRepository get storageRepository;

  TransportStrategy get currentTransport;

  @override
  Future<List<PublicKey>> getKeysToDerive({
    required PublicKey masterKey,
    required String password,
    int offset = 0,
    int limit = _maxDeriveKeys,
  }) {
    return keyStore.getPublicKeys(
      DerivedKeyGetPublicKeys(
        masterKey: masterKey,
        offset: offset,
        limit: limit,
        password: Password.explicit(
          PasswordExplicit(
            password: password,
            cacheBehavior: const PasswordCacheBehavior.nop(),
          ),
        ),
      ),
    );
  }

  @override
  Future<List<PublicKey>> deriveKeys({
    required List<int> accountIds,
    required String password,
    required PublicKey masterKey,
    bool addActiveAccounts = true,
  }) async {
    final publicKeys = await keyStore.addKeys(
      accountIds
          .map(
            (accountId) => DerivedKeyCreateInput.derive(
              DerivedKeyCreateInputDerive(
                masterKey: masterKey,
                accountId: accountId,
                password: Password.explicit(
                  PasswordExplicit(
                    password: password,
                    cacheBehavior: const PasswordCacheBehavior.nop(),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );

    if (addActiveAccounts) {
      unawaited(triggerAddingAccounts(publicKeys));
    }

    return publicKeys;
  }

  @override
  Future<PublicKey> deriveKey({
    required int accountId,
    required String password,
    required PublicKey masterKey,
    bool addActiveAccounts = true,
  }) async {
    final publicKey = await keyStore.addKey(
      DerivedKeyCreateInput.derive(
        DerivedKeyCreateInputDerive(
          masterKey: masterKey,
          accountId: accountId,
          password: Password.explicit(
            PasswordExplicit(
              password: password,
              cacheBehavior: const PasswordCacheBehavior.nop(),
            ),
          ),
        ),
      ),
    );

    if (addActiveAccounts) {
      unawaited(triggerAddingAccounts([publicKey]));
    }

    return publicKey;
  }

  @override
  Future<PublicKey> addSeed({
    required List<String> phrase,
    required String password,
    MnemonicType? mnemonicType,
    String? name,
    SeedAddType addType = SeedAddType.create,
  }) async {
    name = name?.isEmpty ?? true ? null : name;
    mnemonicType ??= phrase.length == 24
        ? const MnemonicType.legacy()
        : const MnemonicType.bip39(
            Bip39MnemonicData(
              accountId: 0,
              path: Bip39Path.ever,
              entropy: Bip39Entropy.bits128,
            ),
          );

    final phraseStr = phrase.join(' ');
    final passwordExplicit = Password.explicit(
      PasswordExplicit(
        password: password,
        cacheBehavior: const PasswordCacheBehavior.nop(),
      ),
    );

    final useEncryptedKey = switch (mnemonicType) {
      MnemonicType_Legacy() => true,
      MnemonicType_Bip39(:final field0) => field0.path == Bip39Path.ton,
    };

    final createKeyInput = useEncryptedKey
        ? EncryptedKeyCreateInput(
            phrase: phraseStr,
            password: passwordExplicit,
            mnemonicType: mnemonicType,
          )
        : DerivedKeyCreateInput.import(
            DerivedKeyCreateInputImport(
              phrase: phraseStr,
              password: passwordExplicit,
            ),
          );

    final publicKey = await keyStore.addKey(createKeyInput);

    await storageRepository.updateSeedMetadata(
      masterKey: publicKey,
      meta: SeedMetadata(
        name: name,
        addType: addType,
        addedAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );

    if (addType == SeedAddType.create) {
      // no need to scan for existing wallets
      // if seed was created from scratch
      await addDefaultAccount(publicKey);
    } else {
      if (useEncryptedKey) {
        unawaited(triggerAddingAccounts([publicKey]));
      } else {
        unawaited(
          triggerDerivingKeys(masterKey: publicKey, password: password),
        );
      }
    }

    return publicKey;
  }

  Future<void> addDefaultAccount(PublicKey publicKey) async {
    final transport = currentTransport;
    if (transport.transport.disposed) return;

    final defaultAccount = AccountToAdd(
      name: transport.defaultAccountName(transport.defaultWalletType),
      publicKey: publicKey,
      contract: transport.defaultWalletType,
      workchain: defaultWorkchainId,
    );

    await GetIt.instance<AccountRepository>().addAccount(defaultAccount);
  }

  /// Initiates the process of deriving additional keys from a master key and
  /// adds active accounts. Additionally, it triggers adding accounts to the
  /// master key.
  ///
  /// This method searches for active wallets associated with derived keys and
  /// adds them to the repository.
  /// It starts from the second derived key (skipping the first which is assumed
  /// to be already added) and continues until it finds no more active wallets.
  ///
  /// Parameters:
  /// - [masterKey]: The master public key used for deriving additional keys
  /// - [password]: The password required to decrypt and use the master key
  ///
  /// The method will not perform any actions if no new active accounts are
  /// found.
  Future<void> triggerDerivingKeys({
    required PublicKey masterKey,
    required String password,
  }) async {
    _findingDerivedKeysSubject.add(
      Set.of(_findingDerivedKeysSubject.value)..add(masterKey.toString()),
    );

    try {
      await triggerAddingAccounts([masterKey]);

      final transport = currentTransport;
      final accounts = accountsStorage.accounts.map((e) => e.address).toSet();
      final existingKeys = keyStore.keys.map((e) => e.publicKey).toSet();
      final accountsToAdd = <AccountToAdd>[];
      final accountIds = <int>[];

      final keys = await getKeysToDerive(
        masterKey: masterKey,
        password: password,
      );

      // skip first key, because it's already added
      for (var accountId = 1; accountId < keys.length; accountId++) {
        if (transport.transport.disposed) break;

        // Logic is the same as in triggerAddingAccounts method but without
        // adding default account if no accounts were found.
        final key = keys[accountId];
        final found = await TonWallet.findExistingWallets(
          transport: transport.transport,
          workchainId: defaultWorkchainId,
          publicKey: key,
          walletTypes: transport.availableWalletTypes,
        );

        final activeAccounts = found.where((e) => e.isActive);
        if (activeAccounts.isEmpty) break;

        final notExistedAccounts = activeAccounts.where(
          (active) => !accounts.contains(active.address),
        );

        // check if key already exists in storage
        if (!existingKeys.contains(key)) {
          accountIds.add(accountId);
        }

        accountsToAdd.addAll(
          notExistedAccounts.map(
            (a) => AccountToAdd(
              publicKey: a.publicKey,
              contract: a.walletType,
              workchain: a.address.workchain,
              name: transport.defaultAccountName(a.walletType),
            ),
          ),
        );
      }

      if (accountIds.isNotEmpty) {
        await deriveKeys(
          accountIds: accountIds,
          password: password,
          masterKey: masterKey,
          addActiveAccounts: false,
        );
      }

      if (accountsToAdd.isNotEmpty) {
        await GetIt.instance<AccountRepository>().addAccounts(accountsToAdd);
      }
    } finally {
      _findingDerivedKeysSubject.add(
        Set.of(_findingDerivedKeysSubject.value)..remove(masterKey.toString()),
      );
    }
  }

  /// Trigger adding accounts to [AccountRepository] by public keys.
  Future<void> triggerAddingAccounts(List<PublicKey> publicKeys) async {
    final transport = currentTransport;
    final keys = publicKeys.map((item) => item.toString()).toSet();
    final accounts = accountsStorage.accounts.map((e) => e.address).toSet();

    _findingExistingWalletsSubject.add(
      _findingExistingWalletsSubject.value.union(keys),
    );

    for (final key in publicKeys) {
      if (transport.transport.disposed) {
        _findingExistingWalletsSubject.add(
          _findingExistingWalletsSubject.value.difference(keys),
        );
        return;
      }

      try {
        final foundAccounts = <ExistingWalletInfo>[];
        final accountsToAdd = <AccountToAdd>[];

        final found = await TonWallet.findExistingWallets(
          transport: transport.transport,
          workchainId: defaultWorkchainId,
          publicKey: key,
          walletTypes: transport.availableWalletTypes,
        );

        final activeAccounts = found.where((e) => e.isActive);

        // If account already in storage, skip it
        final notExistedAccounts = activeAccounts.where(
          (active) => !accounts.contains(active.address),
        );

        // If no accounts were found for this key, then create default one.
        // We must create default if no accounts were found in general.
        if (activeAccounts.isEmpty) {
          accountsToAdd.add(
            AccountToAdd(
              name: transport.defaultAccountName(transport.defaultWalletType),
              publicKey: key,
              contract: transport.defaultWalletType,
              workchain: defaultWorkchainId,
            ),
          );
        } else {
          // but we add here only accounts not existed in storage
          foundAccounts.addAll(notExistedAccounts);
        }

        accountsToAdd.addAll(
          activeAccounts.map(
            (a) => AccountToAdd(
              publicKey: a.publicKey,
              contract: a.walletType,
              workchain: a.address.workchain,
              name: transport.defaultAccountName(a.walletType),
            ),
          ),
        );

        await GetIt.instance<AccountRepository>().addAccounts(accountsToAdd);
      } finally {
        _findingExistingWalletsSubject.add(
          {..._findingExistingWalletsSubject.value}..remove(key.toString()),
        );
      }
    }
  }

  @override
  Future<void> changeSeedPassword({
    required PublicKey publicKey,
    required String oldPassword,
    required String newPassword,
    required bool isLegacy,
  }) async {
    final updateKeyInput = isLegacy
        ? EncryptedKeyUpdateParams.changePassword(
            EncryptedKeyUpdateParamsChangePassword(
              publicKey: publicKey,
              oldPassword: Password.explicit(
                PasswordExplicit(
                  password: oldPassword,
                  cacheBehavior: const PasswordCacheBehavior.nop(),
                ),
              ),
              newPassword: Password.explicit(
                PasswordExplicit(
                  password: newPassword,
                  cacheBehavior: const PasswordCacheBehavior.nop(),
                ),
              ),
            ),
          )
        : DerivedKeyUpdateParams.changePassword(
            DerivedKeyUpdateParamsChangePassword(
              masterKey: publicKey,
              oldPassword: Password.explicit(
                PasswordExplicit(
                  password: oldPassword,
                  cacheBehavior: const PasswordCacheBehavior.nop(),
                ),
              ),
              newPassword: Password.explicit(
                PasswordExplicit(
                  password: newPassword,
                  cacheBehavior: const PasswordCacheBehavior.nop(),
                ),
              ),
            ),
          );

    await keyStore.updateKey(updateKeyInput);
  }

  @override
  Future<void> renameKey({
    required PublicKey publicKey,
    required PublicKey masterKey,
    required String name,
    required bool isLegacy,
  }) async {
    final updateKeyInput = isLegacy
        ? EncryptedKeyUpdateParams.rename(
            EncryptedKeyUpdateParamsRename(
              publicKey: publicKey,
              name: name,
            ),
          )
        : DerivedKeyUpdateParams.renameKey(
            DerivedKeyUpdateParamsRenameKey(
              masterKey: masterKey,
              publicKey: publicKey,
              name: name,
            ),
          );

    await keyStore.updateKey(updateKeyInput);
  }

  @override
  Future<void> renameSeed({
    required PublicKey masterKey,
    required String name,
  }) =>
      storageRepository.updateSeedName(masterKey: masterKey, name: name);

  @override
  Future<List<String>> exportSeed({
    required PublicKey masterKey,
    required String password,
    required bool isLegacy,
  }) async {
    final exportKeyInput = isLegacy
        ? EncryptedKeyPassword(
            publicKey: masterKey,
            password: Password.explicit(
              PasswordExplicit(
                password: password,
                cacheBehavior: const PasswordCacheBehavior.nop(),
              ),
            ),
          )
        : DerivedKeyExportSeedParams(
            masterKey: masterKey,
            password: Password.explicit(
              PasswordExplicit(
                password: password,
                cacheBehavior: const PasswordCacheBehavior.nop(),
              ),
            ),
          );

    final exportKeyOutput = await keyStore.exportSeed(exportKeyInput);

    final List<String> phrase;

    if (exportKeyInput is EncryptedKeyPassword) {
      phrase =
          (exportKeyOutput as EncryptedKeyExportSeedOutput).phrase.split(' ');
    } else if (exportKeyInput is DerivedKeyExportSeedParams) {
      phrase = (exportKeyOutput as DerivedKeyExportOutput).phrase.split(' ');
    } else {
      throw UnsupportedError('Invalid signer');
    }

    return phrase;
  }

  @override
  Future<List<EncryptedData>> encrypt({
    required String data,
    required List<PublicKey> publicKeys,
    required EncryptionAlgorithm algorithm,
    required SignInput signInput,
  }) =>
      keyStore.encrypt(
        data: data,
        publicKeys: publicKeys,
        algorithm: algorithm,
        input: signInput,
      );

  @override
  Future<String> decrypt({
    required EncryptedData data,
    required SignInput signInput,
  }) =>
      keyStore.decrypt(data: data, input: signInput);

  @override
  Future<String> sign({
    required String data,
    required SignInput signInput,
    required int? signatureId,
  }) =>
      keyStore.sign(
        data: data,
        input: signInput,
        signatureId: signatureId,
      );

  @override
  Future<SignedData> signData({
    required String data,
    required SignInput signInput,
    required int? signatureId,
  }) =>
      keyStore.signData(
        data: data,
        input: signInput,
        signatureId: signatureId,
      );

  @override
  Future<SignedDataRaw> signRawData({
    required String data,
    required SignInput signInput,
    required int? signatureId,
  }) =>
      keyStore.signDataRaw(
        data: data,
        input: signInput,
        signatureId: signatureId,
      );

  @override
  Future<List<PublicKey>> removeKeys(List<SeedKey> keys) async {
    final removed = await keyStore.removeKeys(
      publicKeys: keys.map((e) => e.publicKey).toList(),
    );
    unawaited(
      triggerRemovingAccounts(
        keys.where((k) => removed.contains(k.publicKey)),
      ),
    );

    return removed;
  }

  /// Remove accounts, specified for [keys] that were removed.
  /// Also removes information from storage about hidden and external accounts.
  Future<void> triggerRemovingAccounts(Iterable<SeedKey> keys) async {
    final accountsToRemove = <KeyAccount>[];

    for (final key in keys) {
      for (final account in key.accountList.allAccounts) {
        accountsToRemove.add(account);
      }
    }
    await GetIt.instance<AccountRepository>().removeAccounts(accountsToRemove);
  }
}
