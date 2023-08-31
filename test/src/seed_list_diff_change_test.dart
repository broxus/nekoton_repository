import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

void main() {
  const superMasterName = 'SUPER MASTER';
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

  group('NekotonRepository.findChanges', () {
    test('Finds adding new seed with keys and accounts', () {
      final oldList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2],
        mappedAccounts: {masterKey2.publicKey: accounts2},
      );
      final newList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final changes = NekotonRepository().findChanges(oldList, newList);

      expect(
        changes.addedSeeds,
        [
          SeedDiffed(
            name: masterKey.publicKey.toEllipseString(),
            masterKey: masterKey.publicKey,
          ),
        ],
      );
      expect(changes.deletedSeeds.isEmpty, isTrue);

      expect(
        changes.addedKeys,
        unorderedEquals([
          SeedKeyDiffed(key: masterKey),
          SeedKeyDiffed(key: subKey1),
          SeedKeyDiffed(key: subKey2),
        ]),
      );
      expect(changes.deletedKeys.isEmpty, isTrue);

      expect(
        changes.addedAccounts,
        unorderedEquals(
          [
            KeyAccountDiffed(
              account: account1Pure.account,
              publicKey: account1Pure.publicKey,
              isExternal: account1Pure.isExternal,
              isHidden: account1Pure.isHidden,
            ),
            KeyAccountDiffed(
              account: account1ExternalHidden.account,
              publicKey: account1ExternalHidden.publicKey,
              isExternal: account1ExternalHidden.isExternal,
              isHidden: account1ExternalHidden.isHidden,
            ),
            KeyAccountDiffed(
              account: account2External.account,
              publicKey: account2External.publicKey,
              isExternal: account2External.isExternal,
              isHidden: account2External.isHidden,
            ),
            KeyAccountDiffed(
              account: accountSub1Pure.account,
              publicKey: accountSub1Pure.publicKey,
              isExternal: accountSub1Pure.isExternal,
              isHidden: accountSub1Pure.isHidden,
            ),
            KeyAccountDiffed(
              account: accountSub2Hidden.account,
              publicKey: accountSub2Hidden.publicKey,
              isExternal: accountSub2Hidden.isExternal,
              isHidden: accountSub2Hidden.isHidden,
            ),
          ],
        ),
      );
      expect(changes.deletedAccounts.isEmpty, isTrue);
    });

    test('Finds deleting seed with keys and accounts', () {
      final oldList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );
      final newList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2],
        mappedAccounts: {masterKey2.publicKey: accounts2},
      );

      final changes = NekotonRepository().findChanges(oldList, newList);

      expect(
        changes.deletedSeeds,
        [
          SeedDiffed(
            name: masterKey.publicKey.toEllipseString(),
            masterKey: masterKey.publicKey,
          ),
        ],
      );
      expect(changes.addedSeeds.isEmpty, isTrue);

      expect(
        changes.deletedKeys,
        unorderedEquals([
          SeedKeyDiffed(key: masterKey),
          SeedKeyDiffed(key: subKey1),
          SeedKeyDiffed(key: subKey2),
        ]),
      );
      expect(changes.addedKeys.isEmpty, isTrue);

      expect(
        changes.deletedAccounts,
        unorderedEquals(
          [
            KeyAccountDiffed(
              account: account1Pure.account,
              publicKey: account1Pure.publicKey,
              isExternal: account1Pure.isExternal,
              isHidden: account1Pure.isHidden,
            ),
            KeyAccountDiffed(
              account: account1ExternalHidden.account,
              publicKey: account1ExternalHidden.publicKey,
              isExternal: account1ExternalHidden.isExternal,
              isHidden: account1ExternalHidden.isHidden,
            ),
            KeyAccountDiffed(
              account: account2External.account,
              publicKey: account2External.publicKey,
              isExternal: account2External.isExternal,
              isHidden: account2External.isHidden,
            ),
            KeyAccountDiffed(
              account: accountSub1Pure.account,
              publicKey: accountSub1Pure.publicKey,
              isExternal: accountSub1Pure.isExternal,
              isHidden: accountSub1Pure.isHidden,
            ),
            KeyAccountDiffed(
              account: accountSub2Hidden.account,
              publicKey: accountSub2Hidden.publicKey,
              isExternal: accountSub2Hidden.isExternal,
              isHidden: accountSub2Hidden.isHidden,
            ),
          ],
        ),
      );
      expect(changes.addedAccounts.isEmpty, isTrue);
    });

    test('Finds adding key with accounts', () {
      final oldList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
        },
      );
      final newList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final changes = NekotonRepository().findChanges(oldList, newList);

      expect(changes.deletedSeeds.isEmpty, isTrue);
      expect(changes.addedSeeds.isEmpty, isTrue);

      expect(changes.addedKeys, [SeedKeyDiffed(key: subKey2)]);
      expect(changes.deletedKeys.isEmpty, isTrue);

      expect(
        changes.addedAccounts,
        [
          KeyAccountDiffed(
            account: accountSub2Hidden.account,
            publicKey: accountSub2Hidden.publicKey,
            isExternal: accountSub2Hidden.isExternal,
            isHidden: accountSub2Hidden.isHidden,
          ),
        ],
      );
      expect(changes.deletedAccounts.isEmpty, isTrue);
    });

    test('Finds deleting key with accounts', () {
      final oldList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );
      final newList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
        },
      );

      final changes = NekotonRepository().findChanges(oldList, newList);

      expect(changes.deletedSeeds.isEmpty, isTrue);
      expect(changes.addedSeeds.isEmpty, isTrue);

      expect(changes.deletedKeys, [SeedKeyDiffed(key: subKey2)]);
      expect(changes.addedKeys.isEmpty, isTrue);

      expect(
        changes.deletedAccounts,
        [
          KeyAccountDiffed(
            account: accountSub2Hidden.account,
            publicKey: accountSub2Hidden.publicKey,
            isExternal: accountSub2Hidden.isExternal,
            isHidden: accountSub2Hidden.isHidden,
          ),
        ],
      );
      expect(changes.addedAccounts.isEmpty, isTrue);
    });

    test('Finds adding accounts', () {
      final oldList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );
      final newList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final changes = NekotonRepository().findChanges(oldList, newList);

      expect(changes.deletedSeeds.isEmpty, isTrue);
      expect(changes.addedSeeds.isEmpty, isTrue);

      expect(changes.deletedKeys.isEmpty, isTrue);
      expect(changes.addedKeys.isEmpty, isTrue);

      expect(
        changes.addedAccounts,
        unorderedEquals(
          [
            KeyAccountDiffed(
              account: account1Pure.account,
              publicKey: account1Pure.publicKey,
              isExternal: account1Pure.isExternal,
              isHidden: account1Pure.isHidden,
            ),
            KeyAccountDiffed(
              account: account1ExternalHidden.account,
              publicKey: account1ExternalHidden.publicKey,
              isExternal: account1ExternalHidden.isExternal,
              isHidden: account1ExternalHidden.isHidden,
            ),
          ],
        ),
      );
      expect(changes.deletedAccounts.isEmpty, isTrue);
    });

    test('Finds deleting accounts', () {
      final oldList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey.publicKey: accounts1,
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );
      final newList = SeedList(
        seedNames: const {},
        allKeys: [masterKey2, masterKey, subKey1, subKey2],
        mappedAccounts: {
          masterKey2.publicKey: accounts2,
          subKey1.publicKey: accountsSub1,
          subKey2.publicKey: accountsSub2,
        },
      );

      final changes = NekotonRepository().findChanges(oldList, newList);

      expect(changes.deletedSeeds.isEmpty, isTrue);
      expect(changes.addedSeeds.isEmpty, isTrue);

      expect(changes.deletedKeys.isEmpty, isTrue);
      expect(changes.addedKeys.isEmpty, isTrue);

      expect(
        changes.deletedAccounts,
        unorderedEquals(
          [
            KeyAccountDiffed(
              account: account1Pure.account,
              publicKey: account1Pure.publicKey,
              isExternal: account1Pure.isExternal,
              isHidden: account1Pure.isHidden,
            ),
            KeyAccountDiffed(
              account: account1ExternalHidden.account,
              publicKey: account1ExternalHidden.publicKey,
              isExternal: account1ExternalHidden.isExternal,
              isHidden: account1ExternalHidden.isHidden,
            ),
          ],
        ),
      );
      expect(changes.addedAccounts.isEmpty, isTrue);
    });
  });
}
