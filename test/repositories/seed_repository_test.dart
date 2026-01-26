import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

// ignore_for_file: prefer_const_constructors

class MockBridge extends Mock implements NekotonBridgeApi {}

class MockTransportStrategy extends Mock implements TransportStrategy {}

class MockKeyStore extends Mock implements KeyStore {}

class MockAccountsStorage extends Mock implements AccountsStorage {}

class MockNekotonStorageRepository extends Mock
    implements NekotonStorageRepository {}

class MockAccountRepository extends Mock implements AccountRepository {
  int addAccountsCallCount = 0;
  List<AccountToAdd>? lastAddedAccounts;

  @override
  Future<List<Address>> addAccounts(List<AccountToAdd> accounts) {
    addAccountsCallCount++;
    lastAddedAccounts = accounts;
    return Future.value([]);
  }

  @override
  Future<Address> addAccount(AccountToAdd account) =>
      Future.value(const Address(address: 'address'));

  @override
  Future<void> removeAccounts(List<KeyAccount> accounts) async {}
}

class MockNekotonRepository extends Mock implements NekotonRepository {
  @override
  String? generateDefaultAccountName(PublicKey publicKey) => null;
}

class MockArcTransportBoxTrait extends Mock implements ArcTransportBoxTrait {}

class MockCreateKeyInput extends Mock implements CreateKeyInput {}

class MockEncryptedKeyExportSeedOutput extends Mock
    implements EncryptedKeyExportSeedOutput {}

class MockDerivedKeyExportOutput extends Mock
    implements DerivedKeyExportOutput {}

class _FakeUpdateKeyInput extends Fake implements UpdateKeyInput {}

class _FakeExportKeyInput extends Fake implements ExportKeyInput {}

class MockProtoTransport extends Mock implements ProtoTransport {
  @override
  Future<T> use<T>(Future<T> Function() fn) => fn();
}

class SeedKeyRepositoryTest with SeedKeyRepositoryImpl {
  SeedKeyRepositoryTest(
    this.currentTransport,
    this.keyStore,
    this.accountsStorage,
    this.storageRepository,
  );

  @override
  final MockTransportStrategy currentTransport;

  @override
  final MockKeyStore keyStore;

  @override
  final MockAccountsStorage accountsStorage;

  @override
  final MockNekotonStorageRepository storageRepository;
}

void main() {
  group('SeedKeyRepositoryImpl', () {
    late MockKeyStore keyStore;
    late MockAccountsStorage accountsStorage;
    late MockNekotonStorageRepository storageRepository;
    late MockAccountRepository accountRepository;
    late MockNekotonRepository nekotonRepository;
    late MockTransportStrategy transport;
    late MockProtoTransport proto;
    late SeedKeyRepositoryTest repository;
    late ArcTransportBoxTrait box;

    final bridge = MockBridge();

    setUp(() {
      // Register fallback values for any complex parameter types
      registerFallbackValue(
        const DerivedKeyGetPublicKeys(
          masterKey: PublicKey(publicKey: 'fallback'),
          password: Password.explicit(
            PasswordExplicit(
              password: 'password',
              cacheBehavior: PasswordCacheBehavior.nop(),
            ),
          ),
          offset: 0,
          limit: 0,
        ),
      );
      registerFallbackValue(
        const SeedMetadata(
          name: 'name',
          addType: SeedAddType.import,
          addedAt: 0,
        ),
      );
      registerFallbackValue(MockCreateKeyInput());
      registerFallbackValue(const WalletType.everWallet());
      registerFallbackValue('');
      registerFallbackValue(0);
      registerFallbackValue(_FakeUpdateKeyInput());
      registerFallbackValue(_FakeExportKeyInput());

      keyStore = MockKeyStore();
      accountsStorage = MockAccountsStorage();
      storageRepository = MockNekotonStorageRepository();
      accountRepository = MockAccountRepository();
      nekotonRepository = MockNekotonRepository();
      transport = MockTransportStrategy();
      proto = MockProtoTransport();

      box = MockArcTransportBoxTrait();
      registerFallbackValue(box);

      GetIt.instance.registerSingleton<AccountRepository>(accountRepository);
      GetIt.instance.registerSingleton<NekotonRepository>(nekotonRepository);

      repository = SeedKeyRepositoryTest(
        transport,
        keyStore,
        accountsStorage,
        storageRepository,
      );

      when(() => transport.transport).thenReturn(proto);
      when(
        () => transport.availableWalletTypes,
      ).thenReturn([const WalletType.everWallet()]);
      when(
        () => transport.defaultWalletType,
      ).thenReturn(const WalletType.everWallet());
      when(
        () => transport.defaultAccountName(any()),
      ).thenReturn('defaultAccountName');
      when(() => proto.disposed).thenReturn(false);
      when(() => proto.transportBox).thenReturn(box);
      when(() => storageRepository.seedMeta).thenReturn({});
    });

    setUpAll(() {
      NekotonBridge.initMock(api: bridge);
    });

    tearDown(() {
      GetIt.instance.reset();
    });

    test('findingExistingWallets returns current value', () {
      expect(repository.findingExistingWallets, isEmpty);
    });

    test('findingDerivedKeys returns current value', () {
      expect(repository.findingDerivedKeys, isEmpty);
    });

    group('getKeysToDerive', () {
      test('calls keystore with correct parameters', () async {
        const masterKey = PublicKey(publicKey: 'masterkey');
        const password = 'password';
        const publicKeys = [
          PublicKey(publicKey: 'key1'),
          PublicKey(publicKey: 'key2'),
        ];

        when(
          () => keyStore.getPublicKeys(any()),
        ).thenAnswer((_) async => publicKeys);

        final result = await repository.getKeysToDerive(
          const GetPublicKeysParams.derived(
            masterKey: masterKey,
            password: password,
            limit: 100,
            offset: 0,
          ),
        );

        expect(result, equals(publicKeys));

        verify(
          () => keyStore.getPublicKeys(
            any(
              that: predicate<DerivedKeyGetPublicKeys>(
                (input) =>
                    input.masterKey == masterKey &&
                    input.offset == 0 &&
                    input.limit == 100,
              ),
            ),
          ),
        );
      });

      test('calls keystore with correct parameters (ledger)', () async {
        const publicKeys = [
          PublicKey(publicKey: 'key1'),
          PublicKey(publicKey: 'key2'),
        ];

        when(
          () => keyStore.getPublicKeys(any()),
        ).thenAnswer((_) async => publicKeys);

        final result = await repository.getKeysToDerive(
          const GetPublicKeysParams.ledger(limit: 100, offset: 0),
        );

        expect(result, equals(publicKeys));

        verify(
          () => keyStore.getPublicKeys(
            any(
              that: predicate<LedgerKeyGetPublicKeys>(
                (input) => input.offset == 0 && input.limit == 100,
              ),
            ),
          ),
        );
      });
    });

    group('deriveKeys', () {
      test('calls keystore and triggers adding accounts', () async {
        const masterKey = PublicKey(publicKey: 'masterkey');
        const password = 'password';
        const publicKeys = [
          PublicKey(publicKey: 'key1'),
          PublicKey(publicKey: 'key2'),
        ];

        when(() => keyStore.addKeys(any())).thenAnswer((_) async => publicKeys);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        final result = await repository.deriveKeys(
          workchainId: 0,
          params: const [
            DeriveKeysParams.derived(
              accountId: 0,
              masterKey: masterKey,
              password: password,
            ),
            DeriveKeysParams.derived(
              accountId: 1,
              masterKey: masterKey,
              password: password,
            ),
          ],
        );

        expect(result, equals(publicKeys));
        verify(() => keyStore.addKeys(any()));
      });
    });

    group('addSeed', () {
      test('adds legacy seed correctly', () async {
        final phrase = List.generate(24, (i) => 'word$i');
        const password = 'password';
        const publicKey = PublicKey(publicKey: 'publickey');

        when(() => keyStore.addKey(any())).thenAnswer((_) async => publicKey);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        final result = await repository.addSeed(
          phrase: phrase,
          password: password,
          workchainId: 0,
        );

        expect(result, equals(publicKey));
        verify(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        );
      });

      test('adds BIP39 seed correctly', () async {
        final phrase = List.generate(12, (i) => 'word$i');
        const password = 'password';
        const publicKey = PublicKey(publicKey: 'publickey');

        when(() => keyStore.addKey(any())).thenAnswer((_) async => publicKey);
        when(() => keyStore.getPublicKeys(any())).thenAnswer((_) async => []);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        final result = await repository.addSeed(
          phrase: phrase,
          password: password,
          workchainId: 0,
        );

        expect(result, equals(publicKey));
        verify(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        );
      });
    });

    group('addSeed - default naming', () {
      test('first seed without name gets "Seed 1"', () async {
        final phrase = List.generate(12, (i) => 'word$i');
        const password = 'password';
        const publicKey = PublicKey(publicKey: 'publickey');

        when(() => keyStore.addKey(any())).thenAnswer((_) async => publicKey);
        when(() => keyStore.getPublicKeys(any())).thenAnswer((_) async => []);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(() => storageRepository.seedMeta).thenReturn({});
        when(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        await repository.addSeed(
          phrase: phrase,
          password: password,
          workchainId: 0,
        );

        verify(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(
              named: 'meta',
              that: predicate<SeedMetadata>(
                (meta) => meta.name == '${seedPrefix}1',
              ),
            ),
          ),
        );
      });

      test('sequential seeds get incremented numbers', () async {
        final phrase = List.generate(12, (i) => 'word$i');
        const password = 'password';
        const publicKey = PublicKey(publicKey: 'publickey');
        const pk1 = PublicKey(publicKey: 'pk1');
        const pk2 = PublicKey(publicKey: 'pk2');

        when(() => keyStore.addKey(any())).thenAnswer((_) async => publicKey);
        when(() => keyStore.getPublicKeys(any())).thenAnswer((_) async => []);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(() => storageRepository.seedMeta).thenReturn({
          pk1: const SeedMetadata(name: '${seedPrefix}1'),
          pk2: const SeedMetadata(name: '${seedPrefix}2'),
        });
        when(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        await repository.addSeed(
          phrase: phrase,
          password: password,
          workchainId: 0,
        );

        verify(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(
              named: 'meta',
              that: predicate<SeedMetadata>(
                (meta) => meta.name == '${seedPrefix}3',
              ),
            ),
          ),
        );
      });

      test('gaps are not filled - next after Seed 1 and 3 is 4', () async {
        final phrase = List.generate(12, (i) => 'word$i');
        const password = 'password';
        const publicKey = PublicKey(publicKey: 'publickey');
        const pk1 = PublicKey(publicKey: 'pk1');
        const pk3 = PublicKey(publicKey: 'pk3');

        when(() => keyStore.addKey(any())).thenAnswer((_) async => publicKey);
        when(() => keyStore.getPublicKeys(any())).thenAnswer((_) async => []);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(() => storageRepository.seedMeta).thenReturn({
          pk1: const SeedMetadata(name: '${seedPrefix}1'),
          pk3: const SeedMetadata(name: '${seedPrefix}3'),
        });
        when(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        await repository.addSeed(
          phrase: phrase,
          password: password,
          workchainId: 0,
        );

        verify(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(
              named: 'meta',
              that: predicate<SeedMetadata>(
                (meta) => meta.name == '${seedPrefix}4',
              ),
            ),
          ),
        );
      });

      test('custom names do not affect counter', () async {
        final phrase = List.generate(12, (i) => 'word$i');
        const password = 'password';
        const publicKey = PublicKey(publicKey: 'publickey');
        const pk1 = PublicKey(publicKey: 'pk1');
        const pk2 = PublicKey(publicKey: 'pk2');
        const pk5 = PublicKey(publicKey: 'pk5');

        when(() => keyStore.addKey(any())).thenAnswer((_) async => publicKey);
        when(() => keyStore.getPublicKeys(any())).thenAnswer((_) async => []);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(() => storageRepository.seedMeta).thenReturn({
          pk1: const SeedMetadata(name: '${seedPrefix}1'),
          pk2: const SeedMetadata(name: 'My Custom Seed'),
          pk5: const SeedMetadata(name: '${seedPrefix}5'),
        });
        when(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(named: 'meta'),
          ),
        ).thenAnswer((_) async {});
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: any(named: 'transport'),
            publicKey: any(named: 'publicKey'),
            walletTypes: any(named: 'walletTypes'),
            workchainId: any(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        await repository.addSeed(
          phrase: phrase,
          password: password,
          workchainId: 0,
        );

        verify(
          () => storageRepository.updateSeedMetadata(
            masterKey: publicKey,
            meta: any(
              named: 'meta',
              that: predicate<SeedMetadata>(
                (meta) => meta.name == '${seedPrefix}6',
              ),
            ),
          ),
        );
      });
    });

    group('removeKeys', () {
      test('calls keystore and triggers removing accounts', () async {
        const publicKeys = [
          PublicKey(publicKey: 'key1'),
          PublicKey(publicKey: 'key2'),
        ];
        final seedKeys = [
          SeedKey(
            key: KeyStoreEntry(
              name: 'MasterKey1',
              masterKey: publicKeys[0],
              accountId: 0,
              publicKey: publicKeys[0],
              signerName: const KeySigner.derived().name,
            ),
            accountList: AccountList.empty(publicKeys[0]),
          ),
          SeedKey(
            key: KeyStoreEntry(
              name: 'MasterKey2',
              masterKey: publicKeys[1],
              accountId: 0,
              publicKey: publicKeys[1],
              signerName: const KeySigner.derived().name,
            ),
            accountList: AccountList.empty(publicKeys[1]),
          ),
        ];

        when(
          () => keyStore.removeKeys(publicKeys: publicKeys),
        ).thenAnswer((_) async => publicKeys);

        final result = await repository.removeKeys(seedKeys);

        expect(result, equals(publicKeys));
      });
    });

    group('changeSeedPassword', () {
      test('uses encrypted params for legacy keys', () async {
        const publicKey = PublicKey(publicKey: 'pk');

        when(() => keyStore.updateKey(any())).thenAnswer((_) async {});

        await repository.changeSeedPassword(
          publicKey: publicKey,
          oldPassword: 'old',
          newPassword: 'new',
          isLegacy: true,
        );

        verify(
          () => keyStore.updateKey(any(that: isA<EncryptedKeyUpdateParams>())),
        ).called(1);
      });

      test('uses derived params for non-legacy keys', () async {
        const publicKey = PublicKey(publicKey: 'pk');

        when(() => keyStore.updateKey(any())).thenAnswer((_) async {});

        await repository.changeSeedPassword(
          publicKey: publicKey,
          oldPassword: 'old',
          newPassword: 'new',
          isLegacy: false,
        );

        verify(
          () => keyStore.updateKey(any(that: isA<DerivedKeyUpdateParams>())),
        ).called(1);
      });
    });

    group('renameKey', () {
      test('renames encrypted key using encrypted params', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        const masterKey = PublicKey(publicKey: 'master');
        final entry = KeyStoreEntry(
          name: 'name',
          masterKey: masterKey,
          accountId: 0,
          publicKey: publicKey,
          signerName: KeySigner.encrypted().name,
        );

        when(() => keyStore.keys).thenReturn([entry]);
        when(() => keyStore.updateKey(any())).thenAnswer((_) async {});

        await repository.renameKey(
          publicKey: publicKey,
          masterKey: masterKey,
          name: 'updated',
        );

        verify(
          () => keyStore.updateKey(any(that: isA<EncryptedKeyUpdateParams>())),
        ).called(1);
      });

      test('renames derived key using derived params', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        const masterKey = PublicKey(publicKey: 'master');
        final entry = KeyStoreEntry(
          name: 'name',
          masterKey: masterKey,
          accountId: 0,
          publicKey: publicKey,
          signerName: KeySigner.derived().name,
        );

        when(() => keyStore.keys).thenReturn([entry]);
        when(() => keyStore.updateKey(any())).thenAnswer((_) async {});

        await repository.renameKey(
          publicKey: publicKey,
          masterKey: masterKey,
          name: 'updated',
        );

        verify(
          () => keyStore.updateKey(any(that: isA<DerivedKeyUpdateParams>())),
        ).called(1);
      });

      test('renames ledger key using ledger params', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        const masterKey = PublicKey(publicKey: 'master');
        final entry = KeyStoreEntry(
          name: 'name',
          masterKey: masterKey,
          accountId: 0,
          publicKey: publicKey,
          signerName: KeySigner.ledger().name,
        );

        when(() => keyStore.keys).thenReturn([entry]);
        when(() => keyStore.updateKey(any())).thenAnswer((_) async {});

        await repository.renameKey(
          publicKey: publicKey,
          masterKey: masterKey,
          name: 'updated',
        );

        verify(
          () => keyStore.updateKey(any(that: isA<LedgerUpdateKeyInput>())),
        ).called(1);
      });
    });

    group('exportSeed', () {
      test('exports legacy seed with encrypted password input', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        final output = MockEncryptedKeyExportSeedOutput();

        when(() => output.phrase).thenReturn('a b c');
        when(() => keyStore.exportSeed(any())).thenAnswer((_) async => output);

        final result = await repository.exportSeed(
          masterKey: publicKey,
          password: 'pwd',
          isLegacy: true,
        );

        expect(result, equals(['a', 'b', 'c']));
        verify(
          () => keyStore.exportSeed(any(that: isA<EncryptedKeyPassword>())),
        ).called(1);
      });

      test('exports derived seed with derived params', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        final output = MockDerivedKeyExportOutput();

        when(() => output.phrase).thenReturn('x y');
        when(() => keyStore.exportSeed(any())).thenAnswer((_) async => output);

        final result = await repository.exportSeed(
          masterKey: publicKey,
          password: 'pwd',
          isLegacy: false,
        );

        expect(result, equals(['x', 'y']));
        verify(
          () =>
              keyStore.exportSeed(any(that: isA<DerivedKeyExportSeedParams>())),
        ).called(1);
      });
    });

    group('triggerAddingAccounts', () {
      test('returns early when transport disposed', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        when(() => proto.disposed).thenReturn(true);
        when(() => accountsStorage.accounts).thenReturn([]);

        await repository.triggerAddingAccounts(
          publicKeys: const [publicKey],
          workchainId: 0,
        );

        expect(repository.findingExistingWallets, isEmpty);
        expect(accountRepository.addAccountsCallCount, equals(0));
      });

      test('adds default account when no active wallets found', () async {
        const publicKey = PublicKey(publicKey: 'pk');
        when(() => proto.disposed).thenReturn(false);
        when(() => accountsStorage.accounts).thenReturn([]);
        when(
          () => bridge.crateApiMergedTonWalletDartWrapperFindExistingWallets(
            transport: box,
            publicKey: publicKey.publicKey,
            walletTypes: any<String>(named: 'walletTypes'),
            workchainId: any<int>(named: 'workchainId'),
          ),
        ).thenAnswer((_) => Future.value('[]'));

        await repository.triggerAddingAccounts(
          publicKeys: const [publicKey],
          workchainId: 0,
        );

        expect(accountRepository.addAccountsCallCount, equals(1));
        final account = accountRepository.lastAddedAccounts!.single;
        expect(account.publicKey, publicKey);
        expect(account.contract, const WalletType.everWallet());
        expect(account.name, 'defaultAccountName');
        expect(account.workchain, 0);
        expect(repository.findingExistingWallets, isEmpty);
      });
    });
  });
}
