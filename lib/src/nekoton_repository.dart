import 'dart:async';

import 'package:flutter_nekoton_bridge/flutter_nekoton_bridge.dart' as fnb;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

/// {@template nekoton_repository}
/// Nekoton repository package.
///
/// To look through different modules logic, see [TransportRepository],
/// [SeedKeyRepository], [AccountRepository], [TonWalletRepository].
///
/// To full initialization of repository, use [setupLogger] ->
/// [setupNekotonAndStorage] -> [updateTransport] -> [setupSeedListUpdating].
///
/// {@endtemplate}
@singleton
class NekotonRepository
    with
        TransportRepositoryImpl,
        SeedKeyRepositoryImpl,
        AccountRepositoryImpl,
        TonWalletRepositoryImpl,
        TokenWalletRepositoryImpl {
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

  // TODO(alex-a4): uncomment when ledger will be implemented
  // late final fnb.LedgerConnection _ledgerConnection;

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
  }) async {
    _storageRepository = storage;
    _tonWalletStorage = tonWalletStorage;

    await fnb.initRustToDartCaller();
    _nekotonStorage = await Storage.create(
      get: storage.getStorageData,
      set: storage.setStorageData,
      setUnchecked: storage.setStorageData,
      remove: storage.removeStorageData,
      removeUnchecked: storage.removeStorageData,
    );
    // TODO(alex-a4): uncomment ledger when it will be implemented
    // _ledgerConnection = await LedgerConnection.create(
    //   getPublicKey: (_) => Future.value(''),
    //   connectionSign: ({
    //     required int account,
    //     required List<int> message,
    //     Object? context,
    //   }) =>
    //       Future.value(''),
    // );
    _keyStore = await KeyStore.create(
      storage: _nekotonStorage,
      signers: [
        const KeySigner.encrypted(),
        const KeySigner.derived(),
        // const KeySigner.ledger(),
      ],
    );
    _accountsStorage = await AccountsStorage.create(storage: _nekotonStorage);

    _initHasAnySeeds();
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

  // TODO(alex-a4): add diff checking and hooks for outer usage
  /// List of all keys mapped into seeds
  final _seedsSubject = BehaviorSubject<SeedList>();

  /// List of all seeds (and keys) of application.
  /// Every time when keys are changed, this stream will emit new value.
  ValueStream<SeedList> get seedListStream => _seedsSubject.stream;

  SeedList get seedList => _seedsSubject.value;

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
    _storageRepository.seedNamesStream
        .skip(1)
        .listen((names) => _updateSeedList(seedNames: names));

    _updateSeedList();
  }

  /// Helper method that allows update one of incoming param of [buildSeeds].
  /// Fields, that were not specified will be taken from its cache.
  void _updateSeedList({
    List<KeyStoreEntry>? allKeys,
    List<AssetsList>? allAccounts,
    List<Address>? hiddenAccounts,
    Map<PublicKey, List<Address>>? externalAccounts,
    TransportStrategy? transport,
    Map<PublicKey, String>? seedNames,
  }) {
    _seedsSubject.add(
      buildSeeds(
        allKeys: allKeys ?? _keyStore.keys,
        allAccounts: allAccounts ?? _accountsStorage.accounts,
        hiddenAccounts: hiddenAccounts ?? _storageRepository.hiddenAccounts,
        externalAccounts:
            externalAccounts ?? _storageRepository.externalAccounts,
        transport: transport ?? currentTransport,
        seedNames: seedNames ?? _storageRepository.seedNames,
      ),
    );
  }

  // TODO(alex-a4): understand how transport affects loading existingWallets
  //   like with adding key.
  /// This is a pure function that combine all accounts/keys sources into a
  /// single hierarchy structure.
  SeedList buildSeeds({
    required List<KeyStoreEntry> allKeys,
    required List<AssetsList> allAccounts,
    required List<Address> hiddenAccounts,
    required Map<PublicKey, List<Address>> externalAccounts,
    required TransportStrategy transport,
    required Map<PublicKey, String> seedNames,
  }) {
    final planeExternalAccounts = externalAccounts.values.expand((e) => e);
    final transportedAllAccounts = allAccounts.where(
      (a) => transport.availableWalletTypes.contains(a.tonWallet.contract),
    );
    final mapped = <PublicKey, List<KeyAccount>>{};
    for (final account in transportedAllAccounts) {
      var key = account.publicKey;
      final isHidden = hiddenAccounts.contains(account.address);
      final isExternal = planeExternalAccounts.contains(account.address);
      if (isExternal) {
        key = externalAccounts.keys.firstWhere(
          (k) => externalAccounts[k]!.contains(account.address),
        );
      }

      final keyAccount = KeyAccount(
        account: account,
        isHidden: isHidden,
        isExternal: isExternal,
        publicKey: key,
      );
      mapped[key] = [...?mapped[key], keyAccount];
    }

    return SeedList(
      seedNames: seedNames,
      allKeys: allKeys,
      mappedAccounts: mapped.map(
        (key, value) => MapEntry(
          key,
          AccountList(publicKey: key, allAccounts: value),
        ),
      ),
    );
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

  void _logHandler(fnb.LogEntry logEntry) {
    final logLevel = _toLogLevel(logEntry.level);

    _log.log(logLevel, '${logEntry.tag}: ${logEntry.msg}');
  }

  /// The main log level map
  static final Map<Level, fnb.LogLevel?> _logMap = {
    Level.ALL: fnb.LogLevel.Trace,
    Level.FINEST: fnb.LogLevel.Trace,
    Level.FINER: fnb.LogLevel.Trace,
    Level.FINE: fnb.LogLevel.Debug,
    Level.CONFIG: fnb.LogLevel.Debug,
    Level.INFO: fnb.LogLevel.Info,
    Level.WARNING: fnb.LogLevel.Warn,
    Level.SEVERE: fnb.LogLevel.Error,
    Level.SHOUT: fnb.LogLevel.Error,
    Level.OFF: null,
  };

  Level _toLogLevel(fnb.LogLevel level) {
    return _logMap.keys.firstWhere((key) => _logMap[key] == level);
  }
}
