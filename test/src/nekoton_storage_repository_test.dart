import 'dart:convert';

import 'package:encrypted_storage/encrypted_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class MockEncryptedStorage extends Mock implements EncryptedStorage {}

class MockBridge extends Mock implements NekotonBridgeApi {}

const _hiddenAccountsKey = 'hidden_accounts_key';
const _seedsMetaKey = 'seeds_meta_key';
const _nekotonBridgeKey = 'nekoton_bridge_key';
const _externalAccountsKey = 'external_accounts_key';
const _accountSeedPreferencesKey = 'account_seed_preferences_key';

void main() {
  group('NekotonStorageRepository', () {
    late MockEncryptedStorage storage;
    late NekotonStorageRepository repository;
    late MockBridge bridge;

    setUpAll(() {
      bridge = MockBridge();

      when(
        () => bridge.crateApiMergedNtRepackAddress(
          address: any<String>(named: 'address'),
        ),
      ).thenAnswer(
        (invocation) =>
            invocation.namedArguments[#address] as String? ?? 'repacked',
      );
      when(
        () => bridge.crateApiMergedNtValidateAddress(
          address: any<String>(named: 'address'),
        ),
      ).thenReturn(true);

      NekotonBridge.initMock(api: bridge);
    });

    setUp(() {
      storage = MockEncryptedStorage();
      repository = NekotonStorageRepository(storage);
    });

    test('init seeds streams with stored values', () async {
      const masterKey = PublicKey(publicKey: 'pk1');
      const seedMeta = SeedMetadata(name: 'seed');
      const hiddenAddress = Address(address: 'addr-hidden');
      const externalAddress = Address(address: 'addr-external');

      when(
        () => storage.getDomain(domain: _seedsMetaKey),
      ).thenAnswer((_) async => {masterKey.publicKey: jsonEncode(seedMeta)});
      when(
        () =>
            storage.get(_hiddenAccountsKey, domain: _accountSeedPreferencesKey),
      ).thenAnswer((_) async => jsonEncode([hiddenAddress.address]));
      when(() => storage.getDomain(domain: _externalAccountsKey)).thenAnswer(
        (_) async => {
          masterKey.publicKey: jsonEncode([externalAddress.address]),
        },
      );

      await repository.init();

      expect(repository.seedMeta[masterKey], equals(seedMeta));
      expect(
        repository.hiddenAccounts.map((a) => a.address),
        equals([hiddenAddress.address]),
      );
      expect(
        repository.externalAccounts[masterKey]?.map((a) => a.address),
        equals([externalAddress.address]),
      );
    });

    test('clearSensitiveData clears all domains and preferences', () async {
      when(() => storage.clearDomain(any<String>())).thenAnswer((_) async {});
      when(
        () =>
            storage.delete(any<String>(), domain: any<String>(named: 'domain')),
      ).thenAnswer((_) async {});

      await repository.clearSensitiveData();

      verify(() => storage.clearDomain(_accountSeedPreferencesKey)).called(1);
      verify(() => storage.clearDomain(_nekotonBridgeKey)).called(1);
      verify(() => storage.clearDomain(_seedsMetaKey)).called(1);
      verify(() => storage.clearDomain(_externalAccountsKey)).called(1);
      verify(
        () => storage.delete(
          _hiddenAccountsKey,
          domain: _accountSeedPreferencesKey,
        ),
      ).called(1);
    });

    group('storage data bridge', () {
      test('getStorageData returns stored value', () async {
        when(
          () => storage.get('key', domain: _nekotonBridgeKey),
        ).thenAnswer((_) async => 'value');

        final result = await repository.getStorageData('key');

        expect(result, equals('value'));
        verify(() => storage.get('key', domain: _nekotonBridgeKey)).called(1);
      });

      test('setStorageData stores value in bridge domain', () async {
        when(
          () => storage.set(
            any<String>(),
            any<String>(),
            domain: any<String>(named: 'domain'),
          ),
        ).thenAnswer((_) async {});

        await repository.setStorageData(key: 'k', value: 'v');

        verify(
          () => storage.set('k', 'v', domain: _nekotonBridgeKey),
        ).called(1);
      });

      test('removeStorageData deletes value from bridge domain', () async {
        when(
          () => storage.delete(
            any<String>(),
            domain: any<String>(named: 'domain'),
          ),
        ).thenAnswer((_) async {});

        await repository.removeStorageData('k');

        verify(() => storage.delete('k', domain: _nekotonBridgeKey)).called(1);
      });

      test('clearStorageData clears bridge domain', () async {
        when(() => storage.clearDomain(any<String>())).thenAnswer((_) async {});

        await repository.clearStorageData();

        verify(() => storage.clearDomain(_nekotonBridgeKey)).called(1);
      });
    });

    group('seed metadata', () {
      test('readSeedMeta decodes stored map', () async {
        const masterKey = PublicKey(publicKey: 'pk');
        const meta = SeedMetadata(name: 'name');

        when(
          () => storage.getDomain(domain: _seedsMetaKey),
        ).thenAnswer((_) async => {masterKey.publicKey: jsonEncode(meta)});

        final result = await repository.readSeedMeta();

        expect(result, {masterKey: meta});
      });

      test(
        'updateSeedName replaces only the name and refreshes stream',
        () async {
          const masterKey = PublicKey(publicKey: 'pk');
          const original = SeedMetadata(
            name: 'old',
            addType: SeedAddType.import,
            addedAt: 1,
          );
          const newName = 'new-name';

          var calls = 0;
          when(() => storage.getDomain(domain: _seedsMetaKey)).thenAnswer((
            _,
          ) async {
            calls++;
            if (calls == 1) {
              return {masterKey.publicKey: jsonEncode(original)};
            }
            return {
              masterKey.publicKey: jsonEncode(original.copyWith(name: newName)),
            };
          });
          when(
            () => storage.set(
              masterKey.publicKey,
              any<String>(),
              domain: _seedsMetaKey,
            ),
          ).thenAnswer((_) async {});

          await repository.updateSeedName(masterKey: masterKey, name: newName);

          verify(
            () => storage.set(
              masterKey.publicKey,
              any<String>(that: contains(newName)),
              domain: _seedsMetaKey,
            ),
          ).called(1);
          expect(repository.seedMeta[masterKey]?.name, equals(newName));
        },
      );

      test('updateSeedName creates metadata when missing', () async {
        const masterKey = PublicKey(publicKey: 'pk');
        const newName = 'created-name';

        String? storedJson;
        when(() => storage.getDomain(domain: _seedsMetaKey)).thenAnswer(
          (_) async => storedJson == null
              ? <String, String>{}
              : {masterKey.publicKey: storedJson!},
        );
        when(
          () => storage.set(
            masterKey.publicKey,
            any<String>(),
            domain: _seedsMetaKey,
          ),
        ).thenAnswer((invocation) async {
          storedJson = invocation.positionalArguments[1] as String;
        });

        await repository.updateSeedName(masterKey: masterKey, name: newName);

        expect(repository.seedMeta[masterKey]?.name, equals(newName));
      });

      test(
        'updateSeedMetadata stores provided metadata and refreshes stream',
        () async {
          const masterKey = PublicKey(publicKey: 'pk');
          const meta = SeedMetadata(name: 'meta-name');

          when(
            () => storage.set(
              masterKey.publicKey,
              any<String>(),
              domain: _seedsMetaKey,
            ),
          ).thenAnswer((_) async {});
          when(
            () => storage.getDomain(domain: _seedsMetaKey),
          ).thenAnswer((_) async => {masterKey.publicKey: jsonEncode(meta)});

          await repository.updateSeedMetadata(masterKey: masterKey, meta: meta);

          verify(
            () => storage.set(
              masterKey.publicKey,
              any<String>(that: contains('meta-name')),
              domain: _seedsMetaKey,
            ),
          ).called(1);
          expect(repository.seedMeta[masterKey], equals(meta));
        },
      );

      test(
        'removeSeedMetadata deletes entry and clears stream value',
        () async {
          const masterKey = PublicKey(publicKey: 'pk');

          when(
            () => storage.delete(masterKey.publicKey, domain: _seedsMetaKey),
          ).thenAnswer((_) async {});
          when(
            () => storage.getDomain(domain: _seedsMetaKey),
          ).thenAnswer((_) async => <String, String>{});

          await repository.removeSeedMetadata(masterKey);

          verify(
            () => storage.delete(masterKey.publicKey, domain: _seedsMetaKey),
          ).called(1);
          expect(repository.seedMeta, isEmpty);
        },
      );

      test('clearSeeds clears domain and resets stream', () async {
        when(() => storage.clearDomain(any<String>())).thenAnswer((_) async {});

        await repository.clearSeeds();

        verify(() => storage.clearDomain(_seedsMetaKey)).called(1);
        expect(repository.seedMeta, isEmpty);
      });
    });

    group('hidden accounts', () {
      test('readHiddenAccounts returns empty when nothing stored', () async {
        when(
          () => storage.get(
            _hiddenAccountsKey,
            domain: _accountSeedPreferencesKey,
          ),
        ).thenAnswer((_) async => null);

        final result = await repository.readHiddenAccounts();

        expect(result, isEmpty);
      });

      test('hideAccounts merges and deduplicates addresses', () async {
        const address1 = Address(address: 'addr1');
        const address2 = Address(address: 'addr2');

        var calls = 0;
        when(
          () => storage.get(
            _hiddenAccountsKey,
            domain: _accountSeedPreferencesKey,
          ),
        ).thenAnswer((_) async {
          calls++;
          if (calls == 1) return jsonEncode([address1.address]);
          return jsonEncode([address1.address, address2.address]);
        });
        when(
          () => storage.set(
            _hiddenAccountsKey,
            any(),
            domain: _accountSeedPreferencesKey,
          ),
        ).thenAnswer((_) async {});

        await repository.hideAccounts([address2, address1]);

        verify(
          () => storage.set(
            _hiddenAccountsKey,
            jsonEncode([address1.address, address2.address]),
            domain: _accountSeedPreferencesKey,
          ),
        ).called(1);
        expect(repository.hiddenAccounts.map((a) => a.address).toSet(), {
          address1.address,
          address2.address,
        });
      });

      test('showAccounts removes provided addresses', () async {
        const address1 = Address(address: 'addr1');
        const address2 = Address(address: 'addr2');

        var calls = 0;
        when(
          () => storage.get(
            _hiddenAccountsKey,
            domain: _accountSeedPreferencesKey,
          ),
        ).thenAnswer((_) async {
          calls++;
          if (calls == 1) {
            return jsonEncode([address1.address, address2.address]);
          }
          return jsonEncode([address2.address]);
        });
        when(
          () => storage.set(
            _hiddenAccountsKey,
            any(),
            domain: _accountSeedPreferencesKey,
          ),
        ).thenAnswer((_) async {});

        await repository.showAccounts([address1]);

        verify(
          () => storage.set(
            _hiddenAccountsKey,
            jsonEncode([address2.address]),
            domain: _accountSeedPreferencesKey,
          ),
        ).called(1);
        expect(
          repository.hiddenAccounts.map((a) => a.address),
          equals([address2.address]),
        );
      });

      test('clearHiddenAccounts deletes entry and resets stream', () async {
        when(
          () => storage.delete(
            _hiddenAccountsKey,
            domain: _accountSeedPreferencesKey,
          ),
        ).thenAnswer((_) async {});

        await repository.clearHiddenAccounts();

        verify(
          () => storage.delete(
            _hiddenAccountsKey,
            domain: _accountSeedPreferencesKey,
          ),
        ).called(1);
        expect(repository.hiddenAccounts, isEmpty);
      });
    });

    group('external accounts', () {
      test('readExternalAccounts decodes domain map', () async {
        const key = PublicKey(publicKey: 'pk');
        const address = Address(address: 'addr');

        when(() => storage.getDomain(domain: _externalAccountsKey)).thenAnswer(
          (_) async => {
            key.publicKey: jsonEncode([address.address]),
          },
        );

        final result = await repository.readExternalAccounts();

        expect(result[key]?.map((a) => a.address), equals([address.address]));
      });

      test('addExternalAccount deduplicates and refreshes stream', () async {
        const key = PublicKey(publicKey: 'pk');
        const address = Address(address: 'addr');

        List<dynamic>? saved;
        when(
          () => storage.get(key.publicKey, domain: _externalAccountsKey),
        ).thenAnswer((_) async => jsonEncode([address.address]));
        when(
          () => storage.set(key.publicKey, any(), domain: _externalAccountsKey),
        ).thenAnswer((invocation) async {
          saved =
              jsonDecode(invocation.positionalArguments[1] as String)
                  as List<dynamic>;
        });
        when(() => storage.getDomain(domain: _externalAccountsKey)).thenAnswer(
          (_) async => {
            key.publicKey: jsonEncode([address.address]),
          },
        );

        await repository.addExternalAccount(publicKey: key, address: address);

        expect(saved, equals([address.address]));
        expect(
          repository.externalAccounts[key]?.map((a) => a.address),
          equals([address.address]),
        );
      });

      test('updateExternalAccounts stores provided list', () async {
        const key = PublicKey(publicKey: 'pk');
        const addresses = ['addr1', 'addr2'];

        when(
          () => storage.set(key.publicKey, any(), domain: _externalAccountsKey),
        ).thenAnswer((_) async {});
        when(
          () => storage.getDomain(domain: _externalAccountsKey),
        ).thenAnswer((_) async => {key.publicKey: jsonEncode(addresses)});

        await repository.updateExternalAccounts(
          publicKey: key,
          accounts: addresses,
        );

        verify(
          () => storage.set(
            key.publicKey,
            jsonEncode(addresses),
            domain: _externalAccountsKey,
          ),
        ).called(1);
        expect(
          repository.externalAccounts[key],
          equals(
            addresses.map((address) => Address(address: address)).toList(),
          ),
        );
      });

      test('removeExternalAccounts filters specified addresses', () async {
        const key = PublicKey(publicKey: 'pk');
        const address1 = Address(address: 'addr1');
        const address2 = Address(address: 'addr2');

        List<dynamic>? saved;
        when(
          () => storage.get(key.publicKey, domain: _externalAccountsKey),
        ).thenAnswer(
          (_) async => jsonEncode([address1.address, address2.address]),
        );
        when(
          () => storage.set(key.publicKey, any(), domain: _externalAccountsKey),
        ).thenAnswer((invocation) async {
          saved =
              jsonDecode(invocation.positionalArguments[1] as String)
                  as List<dynamic>;
        });
        when(() => storage.getDomain(domain: _externalAccountsKey)).thenAnswer(
          (_) async => {
            key.publicKey: jsonEncode([address1.address]),
          },
        );

        await repository.removeExternalAccounts(
          publicKey: key,
          addresses: [address2],
        );

        expect(saved, equals([address1.address]));
        expect(
          repository.externalAccounts[key]?.map((a) => a.address),
          equals([address1.address]),
        );
      });

      test('clearExternalAccounts clears domain and resets stream', () async {
        when(() => storage.clearDomain(any<String>())).thenAnswer((_) async {});

        await repository.clearExternalAccounts();

        verify(() => storage.clearDomain(_externalAccountsKey)).called(1);
        expect(repository.externalAccounts, isEmpty);
      });
    });

    test('clearPreferences clears account seed preferences domain', () async {
      when(() => storage.clearDomain(any<String>())).thenAnswer((_) async {});

      await repository.clearPreferences();

      verify(() => storage.clearDomain(_accountSeedPreferencesKey)).called(1);
    });
  });
}
