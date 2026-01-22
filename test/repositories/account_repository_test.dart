import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _MockAccountsStorage extends Mock implements AccountsStorage {}

class _MockKeyStore extends Mock implements KeyStore {}

class _MockStorageRepository extends Mock implements NekotonStorageRepository {}

class _MockTransport extends Mock implements Transport {}

class _FakeTransportStrategy implements TransportStrategy {
  _FakeTransportStrategy(this.transport);

  @override
  final Transport transport;

  @override
  List<int> get seedPhraseWordsCount => const [12, 24];

  @override
  WalletType get defaultWalletType => const WalletType.everWallet();

  @override
  List<WalletType> get availableWalletTypes => const [WalletType.everWallet()];

  @override
  String get nativeTokenTicker => 'EVER';

  @override
  Address get nativeTokenAddress => const Address(address: '0:native');

  @override
  String get networkName => 'network';

  @override
  String get nativeTokenIcon => '';

  @override
  String accountExplorerLink(Address accountAddress) => '';

  @override
  String transactionExplorerLink(String transactionHash) => '';

  @override
  String get manifestUrl => '';

  @override
  String defaultAccountName(WalletType walletType) => 'default-name';

  @override
  int get defaultNativeCurrencyDecimal => 9;

  @override
  StakingInformation? get stakeInformation => null;

  @override
  String? get tokenApiBaseUrl => null;

  @override
  String? get currencyApiBaseUrl => null;

  @override
  String? get nftApiBaseUrl => null;

  @override
  PollingConfig get pollingConfig => PollingConfig.defaultConfig;

  @override
  Future<GenericTokenWallet> subscribeToken({
    required Address owner,
    required Address rootTokenContract,
  }) => throw UnimplementedError();

  @override
  Future<Map<String, dynamic>?> fetchJson(String url) async => {};
}

class _TestAccountRepository
    with TransportRepositoryImpl, AccountRepositoryImpl {
  _TestAccountRepository({
    required this.accountsStorage,
    required this.keyStore,
    required this.storageRepository,
  });

  @override
  final AccountsStorage accountsStorage;

  @override
  final KeyStore keyStore;

  @override
  final NekotonStorageRepository storageRepository;
}

class _SpyAccountRepository extends _TestAccountRepository {
  _SpyAccountRepository({
    required super.accountsStorage,
    required super.keyStore,
    required super.storageRepository,
  });

  List<KeyAccount>? localArgs;
  List<KeyAccount>? externalArgs;

  @override
  Future<void> removeLocalAccounts(List<KeyAccount> accounts) async {
    localArgs = accounts;
  }

  @override
  Future<void> removeExternalAccounts(List<KeyAccount> accounts) async {
    externalArgs = accounts;
  }
}

Future<List<String>> _listFuture() async => <String>[];

Future<String> _stringFuture() async => '';

AccountToAdd _buildAccountToAdd({
  String name = 'account',
  PublicKey publicKey = const PublicKey(publicKey: 'pk'),
  WalletType contract = const WalletType.everWallet(),
  int workchain = 0,
  Address? explicitAddress,
}) => AccountToAdd(
  name: name,
  publicKey: publicKey,
  contract: contract,
  workchain: workchain,
  explicitAddress: explicitAddress,
);

AssetsList _buildAssetsList(Address address, PublicKey publicKey) => AssetsList(
  name: 'account-name',
  tonWallet: TonWalletAsset(
    address: address,
    publicKey: publicKey,
    contract: const WalletType.everWallet(),
  ),
  additionalAssets: const <String, AdditionalAssets>{},
);

KeyAccount _buildKeyAccount({
  required Address address,
  required PublicKey ownerKey,
  bool isExternal = false,
}) => KeyAccount(
  account: _buildAssetsList(address, ownerKey),
  isExternal: isExternal,
  isHidden: false,
  publicKey: ownerKey,
);

void main() {
  late _MockAccountsStorage accountsStorage;
  late _MockKeyStore keyStore;
  late _MockStorageRepository storageRepository;
  late _FakeTransportStrategy transportStrategy;
  late _MockTransport transport;
  late _TestAccountRepository repository;

  const address = Address(address: '0:address');
  const anotherAddress = Address(address: '0:another');
  const publicKey = PublicKey(publicKey: 'public-key');
  const otherPublicKey = PublicKey(publicKey: 'other-public-key');

  setUpAll(() {
    registerFallbackValue(const WalletType.everWallet());
    registerFallbackValue(const PublicKey(publicKey: 'fallback-pk'));
    registerFallbackValue(const Address(address: '0:fallback'));
    registerFallbackValue(_buildAccountToAdd(name: 'fallback'));
    registerFallbackValue(_listFuture);
    registerFallbackValue(_stringFuture);
  });

  setUp(() async {
    accountsStorage = _MockAccountsStorage();
    keyStore = _MockKeyStore();
    storageRepository = _MockStorageRepository();
    transport = _MockTransport();
    transportStrategy = _FakeTransportStrategy(transport);

    repository = _TestAccountRepository(
      accountsStorage: accountsStorage,
      keyStore: keyStore,
      storageRepository: storageRepository,
    );

    when(() => transport.group).thenReturn('group');
    when(() => transport.disposed).thenReturn(false);
    when(
      () => transport.use<List<String>>(any()),
    ).thenAnswer((_) async => <String>[]);

    when(() => keyStore.keys).thenReturn(const <KeyStoreEntry>[]);

    when(
      () => storageRepository.externalAccounts,
    ).thenReturn(<PublicKey, List<Address>>{});

    when(() => storageRepository.showAccounts(any())).thenAnswer((_) async {});

    when(
      () => storageRepository.removeExternalAccounts(
        publicKey: any(named: 'publicKey'),
        addresses: any(named: 'addresses'),
      ),
    ).thenAnswer((_) async {});

    when(
      () => storageRepository.addExternalAccount(
        publicKey: any(named: 'publicKey'),
        address: any(named: 'address'),
      ),
    ).thenAnswer((_) async {});

    when(() => accountsStorage.accounts).thenReturn(const <AssetsList>[]);

    when(
      () => accountsStorage.removeAccounts(any()),
    ).thenAnswer((_) async => <Address>[]);

    when(
      () => accountsStorage.renameAccount(any(), any()),
    ).thenAnswer((_) async {});

    await repository.updateTransport(transportStrategy);
  });

  group('addAccount', () {
    test('delegates to AccountsStorage', () async {
      final account = _buildAccountToAdd();

      when(
        () => accountsStorage.addAccount(account),
      ).thenAnswer((_) async => address);

      final result = await repository.addAccount(account);

      expect(result, address);
      verify(() => accountsStorage.addAccount(account)).called(1);
    });

    test('addAccounts delegates to AccountsStorage', () async {
      final accounts = <AccountToAdd>[
        _buildAccountToAdd(),
        _buildAccountToAdd(),
      ];

      when(
        () => accountsStorage.addAccounts(accounts),
      ).thenAnswer((_) async => [address, anotherAddress]);

      final result = await repository.addAccounts(accounts);

      expect(result, [address, anotherAddress]);
      verify(() => accountsStorage.addAccounts(accounts)).called(1);
    });
  });

  group('addExternalAccount', () {
    test('returns immediately when transport disposed', () async {
      when(() => transport.disposed).thenReturn(true);

      await repository.addExternalAccount(
        address: address,
        publicKey: publicKey,
        name: 'Name',
      );

      verifyNever(
        () => storageRepository.addExternalAccount(
          publicKey: any(named: 'publicKey'),
          address: any(named: 'address'),
        ),
      );
      verifyNever(() => accountsStorage.addAccount(any()));
    });

    test('throws when no custodians match', () async {
      when(
        () => transport.use<List<String>>(any()),
      ).thenAnswer((_) async => <String>[]);

      expect(
        () => repository.addExternalAccount(
          address: address,
          publicKey: publicKey,
        ),
        throwsA(isA<Exception>()),
      );

      verifyNever(
        () => storageRepository.addExternalAccount(
          publicKey: any(named: 'publicKey'),
          address: any(named: 'address'),
        ),
      );
      verifyNever(() => accountsStorage.addAccount(any()));
    });

    test('adds external link and skips adding existing account', () async {
      when(
        () => transport.use<List<String>>(any()),
      ).thenAnswer((_) async => <String>[publicKey.publicKey]);

      when(
        () => storageRepository.addExternalAccount(
          publicKey: publicKey,
          address: address,
        ),
      ).thenAnswer((_) async {});
      when(
        () => accountsStorage.accounts,
      ).thenReturn([_buildAssetsList(address, publicKey)]);

      await repository.addExternalAccount(
        address: address,
        publicKey: publicKey,
        name: 'Custom',
      );

      verify(
        () => storageRepository.addExternalAccount(
          publicKey: publicKey,
          address: address,
        ),
      ).called(1);
      verifyNever(() => transport.use<String>(any()));
      verifyNever(() => accountsStorage.addAccount(any()));
    });

    test(
      'adds external link and creates missing account with default name',
      () async {
        const walletType = WalletType.walletV3();

        when(
          () => transport.use<List<String>>(any()),
        ).thenAnswer((_) async => <String>[publicKey.publicKey]);

        when(
          () => storageRepository.addExternalAccount(
            publicKey: publicKey,
            address: address,
          ),
        ).thenAnswer((_) async {});

        when(() => accountsStorage.accounts).thenReturn(const <AssetsList>[]);

        final existingJson = {
          'address': address.address,
          'publicKey': publicKey.publicKey,
          'walletType': walletType.toJson(),
          'contractState': ContractState(
            balance: BigInt.zero,
            genTimings: const GenTimings(genLt: '', genUtime: 0),
            isDeployed: true,
          ).toJson(),
        };

        when(
          () => transport.use<String>(any()),
        ).thenAnswer((_) async => jsonEncode(existingJson));

        when(
          () => accountsStorage.addAccount(any()),
        ).thenAnswer((_) async => address);

        await repository.addExternalAccount(
          address: address,
          publicKey: publicKey,
        );

        final captured =
            verify(
                  () => accountsStorage.addAccount(captureAny()),
                ).captured.single
                as AccountToAdd;

        expect(captured.name, 'default-name');
        expect(captured.publicKey, publicKey);
        expect(captured.contract, walletType);
        expect(captured.workchain, address.workchain);
        expect(captured.explicitAddress, address);
      },
    );

    test('uses key store keys when publicKey not provided', () async {
      const entry1 = KeyStoreEntry(
        signerName: '',
        name: '',
        publicKey: publicKey,
        masterKey: publicKey,
        accountId: 0,
      );
      const entry2 = KeyStoreEntry(
        signerName: '',
        name: '',
        publicKey: otherPublicKey,
        masterKey: otherPublicKey,
        accountId: 0,
      );
      when(() => keyStore.keys).thenReturn([entry1, entry2]);

      when(
        () => transport.use<List<String>>(any()),
      ).thenAnswer((_) async => <String>[otherPublicKey.publicKey]);

      when(
        () => storageRepository.addExternalAccount(
          publicKey: otherPublicKey,
          address: address,
        ),
      ).thenAnswer((_) async {});
      when(
        () => accountsStorage.accounts,
      ).thenReturn([_buildAssetsList(address, publicKey)]);

      await repository.addExternalAccount(address: address);

      verify(
        () => storageRepository.addExternalAccount(
          publicKey: otherPublicKey,
          address: address,
        ),
      ).called(1);
      verifyNever(
        () => storageRepository.addExternalAccount(
          publicKey: publicKey,
          address: address,
        ),
      );
    });
  });

  group('removeAccounts', () {
    test('routes local and external accounts to dedicated removers', () async {
      final local = _buildKeyAccount(address: address, ownerKey: publicKey);
      final external = _buildKeyAccount(
        address: anotherAddress,
        ownerKey: publicKey,
        isExternal: true,
      );
      final spy = _SpyAccountRepository(
        accountsStorage: accountsStorage,
        keyStore: keyStore,
        storageRepository: storageRepository,
      );

      await spy.removeAccounts([local, external]);

      expect(spy.localArgs, [local]);
      expect(spy.externalArgs, [external]);
    });
  });

  group('removeLocalAccounts', () {
    test('does nothing when list is empty', () async {
      await repository.removeLocalAccounts(const <KeyAccount>[]);

      verifyNever(() => storageRepository.showAccounts(any()));
      verifyNever(() => accountsStorage.removeAccounts(any()));
    });

    test('throws when any account is external', () async {
      final externalAccount = _buildKeyAccount(
        address: address,
        ownerKey: publicKey,
        isExternal: true,
      );

      expect(
        () => repository.removeLocalAccounts([externalAccount]),
        throwsA(isA<AssertionError>()),
      );
    });

    test('removes accounts after showing them', () async {
      final account1 = _buildKeyAccount(address: address, ownerKey: publicKey);
      final account2 = _buildKeyAccount(
        address: anotherAddress,
        ownerKey: otherPublicKey,
      );

      when(
        () => storageRepository.showAccounts(any()),
      ).thenAnswer((_) async {});

      when(
        () => accountsStorage.removeAccounts(any()),
      ).thenAnswer((_) async => <Address>[]);

      await repository.removeLocalAccounts([account1, account2]);

      verify(
        () => storageRepository.showAccounts([address, anotherAddress]),
      ).called(1);

      verify(
        () => accountsStorage.removeAccounts([address, anotherAddress]),
      ).called(1);
    });
  });

  group('removeExternalAccounts', () {
    test('does nothing when list is empty', () async {
      await repository.removeExternalAccounts(const <KeyAccount>[]);

      verifyNever(
        () => storageRepository.removeExternalAccounts(
          publicKey: any(named: 'publicKey'),
          addresses: any(named: 'addresses'),
        ),
      );
    });

    test('throws when any account is local', () async {
      final localAccount = _buildKeyAccount(
        address: address,
        ownerKey: publicKey,
      );

      expect(
        () => repository.removeExternalAccounts([localAccount]),
        throwsA(isA<AssertionError>()),
      );
    });

    test('removes external marks and purges local copy when needed', () async {
      final externalAccount = _buildKeyAccount(
        address: address,
        ownerKey: publicKey,
        isExternal: true,
      );
      when(() => keyStore.keys).thenReturn(const <KeyStoreEntry>[]);

      when(
        () => storageRepository.removeExternalAccounts(
          publicKey: publicKey,
          addresses: [address],
        ),
      ).thenAnswer((_) async {});

      when(
        () => storageRepository.externalAccounts,
      ).thenReturn(<PublicKey, List<Address>>{});

      when(
        () => storageRepository.showAccounts(any()),
      ).thenAnswer((_) async {});

      when(
        () => accountsStorage.removeAccounts(any()),
      ).thenAnswer((_) async => <Address>[]);

      await repository.removeExternalAccounts([externalAccount]);

      verify(
        () => storageRepository.removeExternalAccounts(
          publicKey: publicKey,
          addresses: [address],
        ),
      ).called(1);

      verify(
        () => storageRepository.showAccounts(
          any<List<Address>>(
            that: predicate(
              (List<Address> accounts) =>
                  accounts.length == 1 && accounts.single == address,
            ),
          ),
        ),
      ).called(1);

      verify(
        () => accountsStorage.removeAccounts(
          any<List<Address>>(
            that: predicate(
              (List<Address> accounts) =>
                  accounts.length == 1 && accounts.single == address,
            ),
          ),
        ),
      ).called(1);
    });

    test('skips purge when account remains external or local', () async {
      final externalAccount = _buildKeyAccount(
        address: address,
        ownerKey: publicKey,
        isExternal: true,
      );
      when(() => keyStore.keys).thenReturn([
        const KeyStoreEntry(
          signerName: '',
          name: '',
          publicKey: publicKey,
          masterKey: publicKey,
          accountId: 0,
        ),
      ]);

      when(
        () => storageRepository.removeExternalAccounts(
          publicKey: publicKey,
          addresses: [address],
        ),
      ).thenAnswer((_) async {});
      when(() => storageRepository.externalAccounts).thenReturn(
        <PublicKey, List<Address>>{
          publicKey: [address],
        },
      );

      when(
        () => storageRepository.showAccounts(any()),
      ).thenAnswer((_) async {});

      when(
        () => accountsStorage.removeAccounts(any()),
      ).thenAnswer((_) async => <Address>[]);

      await repository.removeExternalAccounts([externalAccount]);

      verify(
        () => storageRepository.removeExternalAccounts(
          publicKey: publicKey,
          addresses: [address],
        ),
      ).called(1);

      verify(
        () => storageRepository.showAccounts(
          any<List<Address>>(
            that: predicate((List<Address> accounts) => accounts.isEmpty),
          ),
        ),
      ).called(1);

      verify(
        () => accountsStorage.removeAccounts(
          any<List<Address>>(
            that: predicate((List<Address> accounts) => accounts.isEmpty),
          ),
        ),
      ).called(1);
    });
  });

  group('renameAccount', () {
    test('delegates to AccountsStorage', () async {
      when(
        () => accountsStorage.renameAccount(address, 'new'),
      ).thenAnswer((_) async {});

      await repository.renameAccount(address, 'new');

      verify(() => accountsStorage.renameAccount(address, 'new')).called(1);
    });
  });

  group('token wallet operations', () {
    test('addTokenWallet forwards network group', () async {
      when(
        () => accountsStorage.addTokenWallet(
          address: address,
          rootTokenContract: anotherAddress,
          networkGroup: 'group',
        ),
      ).thenAnswer((_) async => _buildAssetsList(address, publicKey));

      await repository.addTokenWallet(
        address: address,
        rootTokenContract: anotherAddress,
      );

      verify(
        () => accountsStorage.addTokenWallet(
          address: address,
          rootTokenContract: anotherAddress,
          networkGroup: 'group',
        ),
      ).called(1);
    });

    test('addTokenWallets forwards network group', () async {
      when(
        () => accountsStorage.addTokenWallets(
          address: address,
          rootTokenContracts: [anotherAddress],
          networkGroup: 'group',
        ),
      ).thenAnswer((_) async {});

      await repository.addTokenWallets(
        address: address,
        rootTokenContracts: const [anotherAddress],
      );

      verify(
        () => accountsStorage.addTokenWallets(
          address: address,
          rootTokenContracts: [anotherAddress],
          networkGroup: 'group',
        ),
      ).called(1);
    });

    test('removeTokenWallet forwards network group', () async {
      when(
        () => accountsStorage.removeTokenWallet(
          address: address,
          rootTokenContract: anotherAddress,
          networkGroup: 'group',
        ),
      ).thenAnswer((_) async => _buildAssetsList(address, publicKey));

      await repository.removeTokenWallet(
        address: address,
        rootTokenContract: anotherAddress,
      );

      verify(
        () => accountsStorage.removeTokenWallet(
          address: address,
          rootTokenContract: anotherAddress,
          networkGroup: 'group',
        ),
      ).called(1);
    });

    test('removeTokenWallets forwards network group', () async {
      when(
        () => accountsStorage.removeTokenWallets(
          address: address,
          rootTokenContracts: [anotherAddress],
          networkGroup: 'group',
        ),
      ).thenAnswer((_) async {});

      await repository.removeTokenWallets(
        address: address,
        rootTokenContracts: const [anotherAddress],
      );

      verify(
        () => accountsStorage.removeTokenWallets(
          address: address,
          rootTokenContracts: [anotherAddress],
          networkGroup: 'group',
        ),
      ).called(1);
    });
  });
}
