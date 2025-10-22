import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockBridge extends Mock implements NekotonBridgeApi {}

/// Testable version of NekotonRepository that allows setting seed list directly
class TestableNekotonRepository extends NekotonRepository {
  final _testSeedListSubject = BehaviorSubject<SeedList>();

  void setSeedList(SeedList seedList) {
    _testSeedListSubject.add(seedList);
  }

  @override
  SeedList get seedList => _testSeedListSubject.hasValue
      ? _testSeedListSubject.value
      : SeedList(
          seedMeta: const {},
          allKeys: const [],
          mappedAccounts: const {},
        );

  @override
  Future<void> dispose() async {
    await _testSeedListSubject.close();
    await super.dispose();
  }
}

void main() {
  setUpAll(() {
    NekotonBridge.initMock(api: MockBridge());
  });

  group('NekotonRepository.generateDefaultAccountName', () {
    test('first account on master key gets "Account 1.1"', () {
      // Arrange
      final repository = TestableNekotonRepository();
      const masterKey = PublicKey(publicKey: 'masterkey1');
      final masterKeyEntry = KeyStoreEntry(
        name: 'MasterKey',
        masterKey: masterKey,
        accountId: 0,
        publicKey: masterKey,
        signerName: const KeySigner.derived().name,
      );

      final seedList = SeedList(
        seedMeta: {masterKey: const SeedMetadata(name: 'Seed #1')},
        allKeys: [masterKeyEntry],
        mappedAccounts: const {},
      );

      repository.setSeedList(seedList);

      // Act
      final accountName = repository.generateDefaultAccountName(masterKey);

      // Assert
      expect(accountName, equals('Account 1.1'));
    });

    test('sequential accounts get incremented numbers', () {
      // Arrange
      final repository = TestableNekotonRepository();
      const masterKey = PublicKey(publicKey: 'masterkey1');
      final masterKeyEntry = KeyStoreEntry(
        name: 'MasterKey',
        masterKey: masterKey,
        accountId: 0,
        publicKey: masterKey,
        signerName: const KeySigner.derived().name,
      );

      const account1 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.1',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:account1'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      const account2 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.2',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:account2'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      final seedList = SeedList(
        seedMeta: {masterKey: const SeedMetadata(name: 'Seed #1')},
        allKeys: [masterKeyEntry],
        mappedAccounts: {
          masterKey: const AccountList(
            allAccounts: [account1, account2],
            publicKey: masterKey,
          ),
        },
      );

      repository.setSeedList(seedList);

      // Act
      final accountName = repository.generateDefaultAccountName(masterKey);

      // Assert
      expect(accountName, equals('Account 1.3'));
    });

    test('gaps are not filled - Account 1.1, 1.3 -> next is 1.4', () {
      // Arrange
      final repository = TestableNekotonRepository();
      const masterKey = PublicKey(publicKey: 'masterkey1');
      final masterKeyEntry = KeyStoreEntry(
        name: 'MasterKey',
        masterKey: masterKey,
        accountId: 0,
        publicKey: masterKey,
        signerName: const KeySigner.derived().name,
      );

      const account1 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.1',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:account1'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      const account3 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.3',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:account3'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      final seedList = SeedList(
        seedMeta: {masterKey: const SeedMetadata(name: 'Seed #1')},
        allKeys: [masterKeyEntry],
        mappedAccounts: {
          masterKey: const AccountList(
            allAccounts: [account1, account3],
            publicKey: masterKey,
          ),
        },
      );

      repository.setSeedList(seedList);

      // Act
      final accountName = repository.generateDefaultAccountName(masterKey);

      // Assert
      expect(accountName, equals('Account 1.4'));
    });

    test('custom names do not affect counter', () {
      // Arrange
      final repository = TestableNekotonRepository();
      const masterKey = PublicKey(publicKey: 'masterkey1');
      final masterKeyEntry = KeyStoreEntry(
        name: 'MasterKey',
        masterKey: masterKey,
        accountId: 0,
        publicKey: masterKey,
        signerName: const KeySigner.derived().name,
      );

      const account1 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.1',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:account1'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      const customAccount = KeyAccount(
        account: AssetsList(
          name: 'My Custom Account',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:custom'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      const account3 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.3',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:account3'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      final seedList = SeedList(
        seedMeta: {masterKey: const SeedMetadata(name: 'Seed #1')},
        allKeys: [masterKeyEntry],
        mappedAccounts: {
          masterKey: const AccountList(
            allAccounts: [account1, customAccount, account3],
            publicKey: masterKey,
          ),
        },
      );

      repository.setSeedList(seedList);

      // Act
      final accountName = repository.generateDefaultAccountName(masterKey);

      // Assert
      expect(accountName, equals('Account 1.4'));
    });

    test('different key positions are independent', () {
      // Arrange
      final repository = TestableNekotonRepository();
      const masterKey = PublicKey(publicKey: 'masterkey1');
      const subKey = PublicKey(publicKey: 'subkey1');

      final masterKeyEntry = KeyStoreEntry(
        name: 'MasterKey',
        masterKey: masterKey,
        accountId: 0,
        publicKey: masterKey,
        signerName: const KeySigner.derived().name,
      );

      final subKeyEntry = KeyStoreEntry(
        name: 'SubKey',
        masterKey: masterKey,
        accountId: 1,
        publicKey: subKey,
        signerName: const KeySigner.derived().name,
      );

      const masterAccount1 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.1',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:master1'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      const masterAccount2 = KeyAccount(
        account: AssetsList(
          name: 'Account 1.2',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: masterKey,
            address: Address(address: '0:master2'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: masterKey,
        isExternal: false,
        isHidden: false,
      );

      const subAccount1 = KeyAccount(
        account: AssetsList(
          name: 'Account 2.1',
          additionalAssets: {},
          tonWallet: TonWalletAsset(
            publicKey: subKey,
            address: Address(address: '0:sub1'),
            contract: WalletType.everWallet(),
          ),
        ),
        publicKey: subKey,
        isExternal: false,
        isHidden: false,
      );

      final seedList = SeedList(
        seedMeta: {masterKey: const SeedMetadata(name: 'Seed #1')},
        allKeys: [masterKeyEntry, subKeyEntry],
        mappedAccounts: {
          masterKey: const AccountList(
            allAccounts: [masterAccount1, masterAccount2],
            publicKey: masterKey,
          ),
          subKey: const AccountList(
            allAccounts: [subAccount1],
            publicKey: subKey,
          ),
        },
      );

      repository.setSeedList(seedList);

      // Act
      final masterAccountName = repository.generateDefaultAccountName(
        masterKey,
      );
      final subAccountName = repository.generateDefaultAccountName(subKey);

      // Assert
      expect(masterAccountName, equals('Account 1.3'));
      expect(subAccountName, equals('Account 2.2'));
    });
  });
}
