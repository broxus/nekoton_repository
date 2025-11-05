import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nekoton_bridge/flutter_nekoton_bridge.dart' as fnb;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

/// {@template nekoton_repository}
/// Nekoton repository package.
///
/// To look through different modules logic, see [TransportRepository],
/// [SeedKeyRepository], [AccountRepository], [TonWalletRepository].
///
/// To full initialization of repository, use [setupLogger] ->
/// [setupNekotonAndStorage] -> [updateTransport] -> [setupSeedListUpdating]
/// -> [setupWalletsSubscriptions].
///
/// {@endtemplate}
@singleton
class NekotonRepository
    with
        TransportRepositoryImpl,
        SeedKeyRepositoryImpl,
        AccountRepositoryImpl,
        TonWalletRepositoryImpl,
        TokenWalletRepositoryImpl,
        GenericContractRepositoryImpl,
        NftRepositoryImpl {
  /// {@macro nekoton_repository}
  NekotonRepository();

  final _log = Logger('NekotonRepository');

  /// Nekoton's keystore and its getter
  late final fnb.KeyStore _keyStore;

  /// KeyStore must be initialized with [setupNekotonAndStorage] first
  @override
  fnb.KeyStore get keyStore => _keyStore;

  /// Nekoton's accounts storage and its getter
  late final fnb.AccountsStorage _accountsStorage;

  /// AccountsStorage must be initialized with [setupNekotonAndStorage] first
  @override
  fnb.AccountsStorage get accountsStorage => _accountsStorage;

  /// Nekoton's storage aka middleware between nekoton's users and app
  late final fnb.Storage _nekotonStorage;

  /// Storage that stores all nekoton related data, must be initialized with
  /// [setupNekotonAndStorage] first.
  late final NekotonStorageRepository _storageRepository;

  @override
  NekotonStorageRepository get storageRepository => _storageRepository;

  /// Storage that stores ton wallet transactions and information.
  late final TonWalletTransactionsStorage _tonWalletStorage;

  @override
  TonWalletTransactionsStorage get tonWalletStorage => _tonWalletStorage;

  late final TokenWalletTransactionsStorage _tokenWalletStorage;

  @override
  TokenWalletTransactionsStorage get tokenWalletStorage => _tokenWalletStorage;

  late final AbiLoader _abiLoader;

  @override
  AbiLoader get abiLoader => _abiLoader;

  late final NftDataProvider _nftDataProvider;

  @override
  NftDataProvider get nftDataProvider => _nftDataProvider;

  late final fnb.LedgerConnection _ledgerConnection;

  /// Setup nekoton bridge logger
  Future<void> setupLogger({
    required Level level,
    required bool mobileLogger,
  }) async {
    final logLevel = _logMap[level];
    if (logLevel != null) {
      await fnb.setupLogger(
        level: logLevel,
        mobileLogger: mobileLogger,
        logHandler: _logHandler,
      );
    }
  }

  /// Setup nekoton storages
  Future<void> setupNekotonAndStorage({
    required NekotonStorageRepository storage,
    required TonWalletTransactionsStorage tonWalletStorage,
    required TokenWalletTransactionsStorage tokenWalletStorage,
    required LedgerConnectionHandler ledgerConnectionHandler,
    required NftDataProvider nftDataProvider,
    AssetBundle? bundle,
  }) async {
    _storageRepository = storage;
    _tonWalletStorage = tonWalletStorage;
    _tokenWalletStorage = tokenWalletStorage;
    _nftDataProvider = nftDataProvider;

    _nekotonStorage = Storage.create(
      get: storage.getStorageData,
      set: storage.setStorageData,
      setUnchecked: storage.setStorageData,
      remove: storage.removeStorageData,
      removeUnchecked: storage.removeStorageData,
    );
    _ledgerConnection = LedgerConnection.create(ledgerConnectionHandler);
    _keyStore = await KeyStore.create(
      storage: _nekotonStorage,
      signers: [
        const KeySigner.encrypted(),
        const KeySigner.derived(),
        const KeySigner.ledger(),
      ],
      ledgerConnection: _ledgerConnection,
    );
    _accountsStorage = await AccountsStorage.create(storage: _nekotonStorage);
    _abiLoader = AbiLoader(bundle ?? rootBundle);

    _initHasAnySeeds();
  }

  void updateClockOffset(Duration offset) {
    NtpTime.offset = offset;
    fnb.updateClockOffset(offset);
  }

  /// Clear used memory
  Future<void> dispose() async {
    _keyStore.dispose();
    _accountsStorage.dispose();
    _nekotonStorage.dispose();
    await _hasSeeds.close();
  }

  /// Clear the repository by calling nekoton methods
  Future<void> clear() async {
    await _keyStore.clearStore();
    await _accountsStorage.clear();
  }

  /// List of all keys mapped into seeds
  final _seedsSubject = BehaviorSubject<SeedList>();

  /// List of all seeds (and keys) of application.
  /// Every time when keys are changed, this stream will emit new value.
  ValueStream<SeedList> get seedListStream => _seedsSubject.stream;

  SeedList get seedList => _seedsSubject.value;

  /// Subject that allows track changes in [SeedList]
  final _changesSubject = BehaviorSubject<SeedListDiffChange>.seeded(
    SeedListDiffChange.empty,
  );

  /// Stream of changes in [SeedList], there is no any changes if nothing
  /// happened.
  /// Every item is difference only between 2 states, there is no long-time
  /// tracking.
  Stream<SeedListDiffChange> get seedChangesStream => _changesSubject.stream;

  /// Last difference of [SeedList] after any user action.
  /// There is no any changes if nothing happened.
  /// This is difference only between 2 states, there is no long-time tracking.
  SeedListDiffChange? get lastSeedChanges => _changesSubject.valueOrNull;

  /// Start listening list of keys and map them to [SeedList].
  ///
  /// BehaviorSubjects for all of this streams returns last value immediately
  /// but we do not need 5 triggers of [_updateSeedList] method, so we call it
  /// manually in the end
  void setupSeedListUpdating() {
    // We should skip 1-st item to avoid 5x init calls, because BehaviorSubject
    // emits last value after starting listening
    _keyStore.keysStream
        .skip(1)
        .listen((keys) => _updateSeedList(allKeys: keys));
    _accountsStorage.accountsStream
        .skip(1)
        .listen((accounts) => _updateSeedList(allAccounts: accounts));
    _storageRepository.hiddenAccountsStream
        .skip(1)
        .listen((hidden) => _updateSeedList(hiddenAccounts: hidden));
    _storageRepository.externalAccountsStream
        .skip(1)
        .listen((external) => _updateSeedList(externalAccounts: external));
    currentTransportStream
        .skip(1)
        .listen((transport) => _updateSeedList(transport: transport));
    _storageRepository.seedMetaStream
        .skip(1)
        .listen((seedMeta) => _updateSeedList(seedMeta: seedMeta));

    _updateSeedList(needTrackChanges: false);
  }

  late TransportStrategy prevTransport;

  /// Start listening for transport changing to update Ton/Token wallets
  /// subscriptions.
  void setupWalletsSubscriptions() {
    prevTransport = currentTransport;

    // skip 1 to avoid duplicate init because first init should be called
    // from app side via [updateSubscriptions].
    currentTransportStream.skip(1).listen((transport) async {
      await updateTransportSubscriptions();
      await updateTokenTransportSubscriptions();
      updateContractTransportSubscriptions();

      prevTransport = transport;
    });
  }

  /// Helper method that allows update one of incoming param of [buildSeeds].
  /// Fields, that were not specified will be taken from its cache.
  ///
  /// [needTrackChanges] if true, then [findChanges] will be called.
  void _updateSeedList({
    List<KeyStoreEntry>? allKeys,
    List<AssetsList>? allAccounts,
    List<Address>? hiddenAccounts,
    Map<PublicKey, List<Address>>? externalAccounts,
    TransportStrategy? transport,
    Map<PublicKey, SeedMetadata>? seedMeta,
    bool needTrackChanges = true,
  }) {
    final newList = buildSeeds(
      allKeys: allKeys ?? _keyStore.keys,
      allAccounts: allAccounts ?? _accountsStorage.accounts,
      hiddenAccounts: hiddenAccounts ?? _storageRepository.hiddenAccounts,
      externalAccounts: externalAccounts ?? _storageRepository.externalAccounts,
      transport: transport ?? currentTransport,
      seedMeta: seedMeta ?? _storageRepository.seedMeta,
    );
    if (needTrackChanges) {
      _changesSubject.add(findChanges(seedList, newList));
    }
    _seedsSubject.add(newList);
  }

  /// This is a pure function that combine all accounts/keys sources into a
  /// single hierarchy structure.
  SeedList buildSeeds({
    required List<KeyStoreEntry> allKeys,
    required List<AssetsList> allAccounts,
    required List<Address> hiddenAccounts,
    required Map<PublicKey, List<Address>> externalAccounts,
    required TransportStrategy transport,
    required Map<PublicKey, SeedMetadata> seedMeta,
  }) {
    final planeExternalAccounts = externalAccounts.values.expand((e) => e);
    final mapped = <PublicKey, List<KeyAccount>>{};
    for (final account in allAccounts) {
      final key = account.publicKey;
      final isHidden = hiddenAccounts.contains(account.address);
      final isExternal = planeExternalAccounts.contains(account.address);

      // if account is external, then add it to all related publicKeys
      if (isExternal) {
        final allExternalKeys = externalAccounts.keys.where(
          (k) => externalAccounts[k]!.contains(account.address),
        );
        for (final externalKey in allExternalKeys) {
          final keyAccount = KeyAccount(
            account: account,
            isHidden: isHidden,
            isExternal: true,
            publicKey: externalKey,
          );
          mapped[externalKey] = [...?mapped[externalKey], keyAccount];
        }
      } else {
        final keyAccount = KeyAccount(
          account: account,
          isHidden: isHidden,
          isExternal: false,
          publicKey: key,
        );
        mapped[key] = [...?mapped[key], keyAccount];
      }
    }

    return SeedList(
      seedMeta: seedMeta,
      allKeys: allKeys,
      mappedAccounts: mapped.map(
        (key, value) => MapEntry(
          key,
          AccountList(
            publicKey: key,
            allAccounts: value..sort((a, b) => a.name.compareTo(b.name)),
          ),
        ),
      ),
    );
  }

  /// Trying to find difference between [oldList] and [newList] on all levels
  /// of hierarchy.
  /// There are 3 steps:
  /// 1) Find difference on seed level
  /// 2) Find difference on key level
  /// 3) Find difference on account level
  ///
  /// This is not so difficult logic as you can see by its size :)
  ///
  /// All 3 levels has common behaviour searching for:
  /// 1) deleted items (old contains, new dont)
  /// 2) added items (new contains, old dont)
  /// 3) intersected items (both new and old contains) (except of accounts)
  ///
  /// This logic contains a lot of list-search behavior, but if we know, that
  /// there cannot be SO many elements (typically < 50 at all, and hard case
  /// about couple of hundreds), we do not care about hard optimization, trying
  /// to make it easy-to-read.
  // ignore: long-method
  SeedListDiffChange findChanges(SeedList oldList, SeedList newList) {
    var result = SeedListDiffChange.empty;

    final oldSeeds = oldList.seeds;
    final newSeeds = newList.seeds;

    // trying to find difference on seed level, comparing PublicKey because
    // name could be different
    final deletedSeeds = oldSeeds
        // old seeds contains items, that new doesn't
        .where(
          (seed) => newSeeds.none(
            (s) =>
                s.masterPublicKey.publicKey == seed.masterPublicKey.publicKey,
          ),
        );
    final addedSeeds = newSeeds
        // new seeds contains items, that old doesn't
        .where(
          (seed) => oldSeeds.none(
            (s) =>
                s.masterPublicKey.publicKey == seed.masterPublicKey.publicKey,
          ),
        );
    final intersectedSeedsFromOld = oldSeeds
        // items from both lists
        .where(
          (seed) => newSeeds.any(
            (s) =>
                s.masterPublicKey.publicKey == seed.masterPublicKey.publicKey,
          ),
        );
    final intersectedSeedsFromNew = newSeeds
        // items from both lists
        .where(
          (seed) => oldSeeds.any(
            (s) =>
                s.masterPublicKey.publicKey == seed.masterPublicKey.publicKey,
          ),
        );

    /// Add seed-level difference to result
    result = result.expandList(
      deletedSeeds.map(
        (e) => SeedListDiffChange.fromSeed(seed: e, isDeleted: true),
      ),
    );
    result = result.expandList(
      addedSeeds.map(
        (e) => SeedListDiffChange.fromSeed(seed: e, isDeleted: false),
      ),
    );

    for (final oldSeed in intersectedSeedsFromOld) {
      // trying to find difference on key level
      final newSeed = intersectedSeedsFromNew.firstWhere(
        // compare PublicKey because names could be different
        (k) => k.masterPublicKey.publicKey == oldSeed.masterPublicKey.publicKey,
      );

      final deletedKeys = oldSeed.allKeys
          // old keys contains items, that new doesn't
          .where(
            (key) => newSeed.allKeys.none((k) => k.publicKey == key.publicKey),
          );
      final addedKeys = newSeed.allKeys
          // new keys contains items, that old doesn't
          .where(
            (key) => oldSeed.allKeys.none((k) => k.publicKey == key.publicKey),
          );
      final intersectedKeysFromOld = oldSeed.allKeys
          // items from both lists
          .where(
            (key) => newSeed.allKeys.any((k) => k.publicKey == key.publicKey),
          );
      final intersectedKeysFromNew = newSeed.allKeys
          // items from both lists
          .where(
            (key) => oldSeed.allKeys.any((k) => k.publicKey == key.publicKey),
          );

      /// Add key-level difference to result
      result = result.expandList(
        deletedKeys.map(
          (e) => SeedListDiffChange.fromKey(key: e, isDeleted: true),
        ),
      );
      result = result.expandList(
        addedKeys.map(
          (e) => SeedListDiffChange.fromKey(key: e, isDeleted: false),
        ),
      );

      for (final oldKey in intersectedKeysFromOld) {
        // trying to find difference on account level
        final newKey = intersectedKeysFromNew.firstWhere(
          (s) => s.publicKey == oldKey.publicKey,
        );

        final deletedAccounts = oldKey.accountList.allAccounts
            // old accounts contains items, that new doesn't
            .where(
              (acc) => newKey.accountList.allAccounts.none(
                (a) => a.address == acc.address,
              ),
            );
        final addedAccounts = newKey.accountList.allAccounts
            // new accounts contains items, that old doesn't
            .where(
              (acc) => oldKey.accountList.allAccounts.none(
                (a) => a.address == acc.address,
              ),
            );

        /// Add account-level difference to result
        result = result.expandList(
          deletedAccounts.map(
            (e) => SeedListDiffChange.fromAccount(account: e, isDeleted: true),
          ),
        );
        result = result.expandList(
          addedAccounts.map(
            (e) => SeedListDiffChange.fromAccount(account: e, isDeleted: false),
          ),
        );
      }
    }

    return result;
  }

  /// Subject that allows subscribe to seeds existing. This is used by
  /// router guard.
  final _hasSeeds = BehaviorSubject<bool>();

  /// Stream for external usages
  BehaviorSubject<bool> get hasSeeds => _hasSeeds;

  /// Init stream of existed seeds by mapping its values.
  /// This must be called after creating [_keyStore].
  void _initHasAnySeeds() {
    _keyStore.keysStream.listen((keys) => _hasSeeds.add(keys.isNotEmpty));
  }

  /// Generates default account name in format "Account N.M"
  /// where N is the key position in the seed (1-based) and M is the account
  /// position within that key (1-based).
  ///
  /// Returns null if the publicKey is not found in any seed.
  String? generateDefaultAccountName(PublicKey publicKey) {
    final seed = seedList.findSeedByAnyPublicKey(publicKey);
    if (seed == null) return null;

    // Find the key within the seed
    final keyIndex = seed.allKeys.indexWhere(
      (key) => key.publicKey == publicKey,
    );
    if (keyIndex == -1) return null;

    // Key position is 1-based (master key = 1, first derived = 2, etc.)
    final keyPosition = keyIndex + 1;

    // Get next account number by finding max existing number + 1
    final accountPosition = _getNextAccountNumber(
      seed.allKeys[keyIndex].accountList.allAccounts,
      keyPosition,
    );

    return 'Account $keyPosition.$accountPosition';
  }

  /// Gets the next available account number for a specific key position
  /// by finding the maximum number in existing account names
  /// (format: "Account N.M") and returning max M + 1 for the given N.
  /// Returns 1 if no accounts exist or no default names are found.
  int _getNextAccountNumber(List<KeyAccount> accounts, int keyPosition) {
    if (accounts.isEmpty) return 1;

    var maxNumber = 0;

    for (final account in accounts) {
      final name = account.name;

      // Parse "Account N.M" format
      final match = RegExp(r'^Account (\d+)\.(\d+)$').firstMatch(name);
      if (match != null) {
        final n = int.tryParse(match.group(1) ?? '');
        final m = int.tryParse(match.group(2) ?? '');

        // Only consider accounts for this specific key position
        if (n == keyPosition && m != null && m > maxNumber) {
          maxNumber = m;
        }
      }
    }

    return maxNumber + 1;
  }

  void _logHandler(fnb.LogEntry logEntry) {
    final logLevel = _toLogLevel(logEntry.level);

    _log.log(logLevel, '${logEntry.tag}: ${logEntry.msg}', logEntry.stack);
  }

  /// The main log level map
  static final Map<Level, fnb.LogLevel?> _logMap = {
    Level.ALL: fnb.LogLevel.trace,
    Level.FINEST: fnb.LogLevel.trace,
    Level.FINER: fnb.LogLevel.trace,
    Level.FINE: fnb.LogLevel.debug,
    Level.CONFIG: fnb.LogLevel.debug,
    Level.INFO: fnb.LogLevel.info,
    Level.WARNING: fnb.LogLevel.warn,
    Level.SEVERE: fnb.LogLevel.error,
    Level.SHOUT: fnb.LogLevel.error,
    Level.OFF: null,
  };

  Level _toLogLevel(fnb.LogLevel level) {
    return _logMap.keys.firstWhere((key) => _logMap[key] == level);
  }
}
