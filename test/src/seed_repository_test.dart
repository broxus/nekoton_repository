import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class MockBridge extends Mock implements NekotonBridgeApi {}

class MockTransportStrategy extends Mock implements TransportStrategy {}

class MockKeyStore extends Mock implements KeyStore {}

class MockAccountsStorage extends Mock implements AccountsStorage {}

class MockNekotonStorageRepository extends Mock
    implements NekotonStorageRepository {}

class MockAccountRepository extends Mock implements AccountRepository {
  @override
  Future<List<Address>> addAccounts(List<AccountToAdd> accounts) =>
      Future.value([]);

  @override
  Future<Address> addAccount(AccountToAdd account) =>
      Future.value(const Address(address: 'address'));

  @override
  Future<void> removeAccounts(List<KeyAccount> accounts) async {}
}

class MockArcTransportBoxTrait extends Mock implements ArcTransportBoxTrait {}

class MockCreateKeyInput extends Mock implements CreateKeyInput {}

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

      keyStore = MockKeyStore();
      accountsStorage = MockAccountsStorage();
      storageRepository = MockNekotonStorageRepository();
      accountRepository = MockAccountRepository();
      transport = MockTransportStrategy();
      proto = MockProtoTransport();

      box = MockArcTransportBoxTrait();
      registerFallbackValue(box);

      GetIt.instance.registerSingleton<AccountRepository>(accountRepository);

      repository = SeedKeyRepositoryTest(
        transport,
        keyStore,
        accountsStorage,
        storageRepository,
      );

      when(() => transport.transport).thenReturn(proto);
      when(() => transport.availableWalletTypes)
          .thenReturn([const WalletType.everWallet()]);
      when(() => transport.defaultWalletType)
          .thenReturn(const WalletType.everWallet());
      when(() => transport.defaultAccountName(any()))
          .thenReturn('defaultAccountName');
      when(() => proto.disposed).thenReturn(false);
      when(() => proto.transportBox).thenReturn(box);
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

        when(() => keyStore.getPublicKeys(any()))
            .thenAnswer((_) async => publicKeys);

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

        when(() => keyStore.getPublicKeys(any()))
            .thenAnswer((_) async => publicKeys);

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

        when(() => keyStore.removeKeys(publicKeys: publicKeys)).thenAnswer(
          (_) async => publicKeys,
        );

        final result = await repository.removeKeys(seedKeys);

        expect(result, equals(publicKeys));
      });
    });
  });
}
