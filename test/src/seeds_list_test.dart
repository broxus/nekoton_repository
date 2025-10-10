import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class MockBridge extends Mock implements NekotonBridgeApi {}

class AllWalletTypeSupports extends Fake implements TransportStrategy {
  @override
  List<WalletType> get availableWalletTypes => const [
    WalletType.everWallet(),
    WalletType.walletV3(),
    WalletType.multisig(MultisigType.multisig2_1),
  ];
}

class OnlyV3WalletTypeSupports extends Fake implements TransportStrategy {
  @override
  List<WalletType> get availableWalletTypes => const [WalletType.walletV3()];
}

void main() {
  final bridge = MockBridge();
  const superMasterName = 'SUPER MASTER';
  const superMasterMeta = SeedMetadata(name: superMasterName);
  const key1 = PublicKey(publicKey: '1111111111111111111');
  final key1Ellipse = key1.toEllipseString();
  const key2 = PublicKey(publicKey: '2222222222222222222');
  const key3 = PublicKey(publicKey: '3333333333333333333');
  const key4 = PublicKey(publicKey: '4444444444444444444');
  final key4Ellipse = key4.toEllipseString();

  final masterKey = KeyStoreEntry(
    name: 'MasterKey',
    masterKey: key1,
    accountId: 0,
    publicKey: key1,
    signerName: const KeySigner.derived().name,
  );
  final subKey1 = KeyStoreEntry(
    name: 'SubKey',
    masterKey: key1,
    accountId: 1,
    publicKey: key2,
    signerName: const KeySigner.derived().name,
  );
  final subKey2 = KeyStoreEntry(
    name: 'SubKey',
    masterKey: key1,
    accountId: 2,
    publicKey: key3,
    signerName: const KeySigner.derived().name,
  );

  final masterKey2 = KeyStoreEntry(
    name: 'MasterKey2',
    masterKey: key4,
    accountId: 10,
    publicKey: key4,
    signerName: const KeySigner.encrypted().name,
  );

  final account1Pure = KeyAccount(
    account: AssetsList(
      name: 'Account1',
      additionalAssets: {},
      tonWallet: TonWalletAsset(
        publicKey: masterKey.publicKey,
        address: const Address(address: '0:address1'),
        contract: const WalletType.everWallet(),
      ),
    ),
    publicKey: masterKey.publicKey,
    isExternal: false,
    isHidden: false,
  );
  final account1ExternalHidden = KeyAccount(
    account: const AssetsList(
      name: 'Account1Ex',
      additionalAssets: {},
      tonWallet: TonWalletAsset(
        publicKey: PublicKey(publicKey: 'RandomExernalKey'),
        address: Address(address: '0:address1ex'),
        contract: WalletType.everWallet(),
      ),
    ),
    publicKey: masterKey.publicKey,
    isExternal: true,
    isHidden: true,
  );

  final accountSub1Pure = KeyAccount(
    account: AssetsList(
      name: 'AccountSub1',
      additionalAssets: {},
      tonWallet: TonWalletAsset(
        publicKey: subKey1.publicKey,
        address: const Address(address: '0:addressSub1'),
        contract: const WalletType.everWallet(),
      ),
    ),
    publicKey: subKey1.publicKey,
    isExternal: false,
    isHidden: false,
  );

  final accountSub2Hidden = KeyAccount(
    account: AssetsList(
      name: 'AccountSub2',
      additionalAssets: {},
      tonWallet: TonWalletAsset(
        publicKey: subKey2.publicKey,
        address: const Address(address: '0:addressSub2'),
        contract: const WalletType.walletV3(),
      ),
    ),
    publicKey: subKey2.publicKey,
    isExternal: false,
    isHidden: true,
  );

  final account2External = KeyAccount(
    account: const AssetsList(
      name: 'AccountSub2',
      additionalAssets: {},
      tonWallet: TonWalletAsset(
        publicKey: PublicKey(publicKey: 'RandomExernalKey2'),
        address: Address(address: '0:addressSub2Ex'),
        contract: WalletType.multisig(MultisigType.multisig2_1),
      ),
    ),
    publicKey: masterKey2.publicKey,
    isExternal: true,
    isHidden: false,
  );

  final accounts1 = AccountList(
    allAccounts: [account1Pure, account1ExternalHidden],
    publicKey: masterKey.publicKey,
  );
  final accounts2 = AccountList(
    allAccounts: [account2External],
    publicKey: masterKey2.publicKey,
  );
  final accountsSub1 = AccountList(
    allAccounts: [accountSub1Pure],
    publicKey: subKey1.publicKey,
  );
  final accountsSub2 = AccountList(
    allAccounts: [accountSub2Hidden],
    publicKey: subKey2.publicKey,
  );

  setUpAll(() {
    NekotonBridge.initMock(api: bridge);
  });

  group('SeedList test', () {
    test('SeedList only keys creation', () {
      final seedsList = SeedList(
        seedMeta: {masterKey.publicKey: superMasterMeta},
        allKeys: [subKey2, subKey1, masterKey, masterKey2],
        mappedAccounts: const {},
      );

      expect(seedsList.seeds.length, 2);
      final seed1 = seedsList.findSeed(key1)!;
      expect(seed1.name, superMasterName);
      expect(
        seed1.masterKey,
        SeedKey(
          key: masterKey,
          accountList: AccountList.empty(masterKey.publicKey),
        ),
      );
      expect(
        seed1.subKeys,
        equals([
          SeedKey(
            key: subKey1,
            accountList: AccountList.empty(subKey1.publicKey),
          ),
          SeedKey(
            key: subKey2,
            accountList: AccountList.empty(subKey2.publicKey),
          ),
        ]),
      );
      expect(
        seed1.allKeys.map((e) => e.key.accountId).toList(),
        orderedEquals([0, 1, 2]),
      );
      final seed2 = seedsList.findSeed(masterKey2.masterKey)!;
      expect(seed2.name, key4Ellipse);
      expect(
        seed2.masterKey,
        SeedKey(
          key: masterKey2,
          accountList: AccountList.empty(masterKey2.publicKey),
        ),
      );
      expect(seed2.subKeys, equals([]));
    });

    test('SeedsList creation keys with accounts', () {
      final seedsList = SeedList(
        seedMeta: const {},
        allKeys: [masterKey, subKey1, subKey2, masterKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      expect(seedsList.seeds.length, 2);
      final seed1 = seedsList.findSeed(key1)!;
      expect(seed1.name, key1Ellipse);
      expect(seed1.masterKey, SeedKey(key: masterKey, accountList: accounts1));
      expect(seed1.masterKey.accountList.allAccounts.length, 2);
      expect(seed1.masterKey.accountList.externalAccounts, [
        account1ExternalHidden,
      ]);
      expect(seed1.masterKey.accountList.displayAccounts, [account1Pure]);
      expect(seed1.masterKey.accountList.localAccounts, [account1Pure]);
      expect(
        seed1.subKeys,
        equals([
          SeedKey(key: subKey1, accountList: accountsSub1),
          SeedKey(key: subKey2, accountList: accountsSub2),
        ]),
      );
      expect(
        seed1.allKeys.map((e) => e.key.accountId).toList(),
        orderedEquals([0, 1, 2]),
      );

      final seed2 = seedsList.findSeed(key4)!;
      expect(seed2.name, key4Ellipse);
      expect(seed2.masterKey, SeedKey(key: masterKey2, accountList: accounts2));
      expect(seed2.subKeys, equals([]));
    });

    test('SeedsList.findSeedKey', () {
      final seedsList = SeedList(
        seedMeta: const {},
        allKeys: [masterKey, subKey1, subKey2, masterKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final seedKey = seedsList.findSeedKey(key2);
      expect(seedKey, isNotNull);
      expect(seedKey!.publicKey, key2);
      expect(seedKey.key, subKey1);

      final notExisted = seedsList.findSeedKey(
        const PublicKey(publicKey: '000000'),
      );
      expect(notExisted, isNull);
    });

    test('SeedsList.findSeedByAnyPublicKey', () {
      final seedsList = SeedList(
        seedMeta: const {},
        allKeys: [masterKey, subKey1, subKey2, masterKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final seed = seedsList.findSeedByAnyPublicKey(key2);
      expect(seed, isNotNull);
      expect(seed!.masterKey.key, masterKey);
      expect(seed.subKeys.length, 2);

      final notExisted = seedsList.findSeedByAnyPublicKey(
        const PublicKey(publicKey: '000000'),
      );
      expect(notExisted, isNull);
    });

    test('SeedsList.findAccountByAddress', () {
      final seedsList = SeedList(
        seedMeta: const {},
        allKeys: [masterKey, subKey1, subKey2, masterKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final account = seedsList.findAccountByAddress(account1Pure.address);
      expect(account, isNotNull);
      expect(account!.address, account1Pure.address);

      final notExisted = seedsList.findAccountByAddress(
        const Address(address: '0:0000'),
      );
      expect(notExisted, isNull);
    });
  });

  group('NekotonRepository.buildSeeds', () {
    test('All accounts available by transport', () {
      final strategy = AllWalletTypeSupports();
      final seedsList = NekotonRepository().buildSeeds(
        seedMeta: {masterKey.publicKey: superMasterMeta},
        allKeys: [masterKey, subKey1, subKey2, masterKey2],
        allAccounts: [
          account1ExternalHidden.account,
          accountSub1Pure.account,
          account1Pure.account,
          accountSub2Hidden.account,
          account2External.account,
        ],
        hiddenAccounts: [
          account1ExternalHidden.account.address,
          accountSub2Hidden.account.address,
        ],
        externalAccounts: {
          masterKey.publicKey: [account1ExternalHidden.account.address],
          masterKey2.publicKey: [account2External.account.address],
        },
        transport: strategy,
      );

      expect(seedsList.seeds.length, 2);
      final seed1 = seedsList.findSeed(key1)!;
      expect(seed1.name, superMasterName);
      expect(seed1.masterKey, SeedKey(key: masterKey, accountList: accounts1));
      final masterAccounts = seed1.masterKey.accountList.allAccounts;
      expect(masterAccounts.length, 2);
      expect(
        masterAccounts.map((e) => e.name),
        orderedEquals([account1Pure.name, account1ExternalHidden.name]),
      );
      expect(seed1.masterKey.accountList.externalAccounts, [
        account1ExternalHidden,
      ]);
      expect(seed1.masterKey.accountList.displayAccounts, [account1Pure]);
      expect(seed1.masterKey.accountList.localAccounts, [account1Pure]);
      expect(
        seed1.subKeys,
        equals([
          SeedKey(key: subKey1, accountList: accountsSub1),
          SeedKey(key: subKey2, accountList: accountsSub2),
        ]),
      );
      final seed2 = seedsList.findSeed(key4)!;
      expect(seed2.name, key4Ellipse);
      expect(seed2.masterKey, SeedKey(key: masterKey2, accountList: accounts2));
      expect(seed2.subKeys, equals([]));
    });
  });
}
