import 'dart:convert';

import 'package:encrypted_storage/encrypted_storage.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

const _hiddenAccountsKey = 'hidden_accounts_key';
const _seedsKey = 'seeds_key';
const _nekotonBridgeKey = 'nekoton_bridge_key';
const _externalAccountsKey = 'external_accounts_key';

const _accountSeedPreferencesKey = 'account_seed_preferences_key';

/// This is a wrapper-class above [EncryptedStorage] that provides methods
/// to interact with account/seed/public keys and all nekoton's related things.
class NekotonStorageRepository {
  NekotonStorageRepository(this._storage);

  /// Storage that is used to store data
  final EncryptedStorage _storage;

  Future<void> init() => Future.wait([
        _streamedSeedNames(),
        _streamedHiddenAccounts(),
        _streamedExternalAccounts(),
      ]);

  Future<void> clearSensitiveData() => Future.wait([
        clearPreferences(),
        clearStorageData(),
        clearSeeds(),
        clearExternalAccounts(),
      ]);

  /// Get data of nekoton storage
  Future<String?> getStorageData(String key) async =>
      _storage.get(key, domain: _nekotonBridgeKey);

  /// Set data of nekoton storage
  Future<void> setStorageData({
    required String key,
    required String value,
  }) =>
      _storage.set(key, value, domain: _nekotonBridgeKey);

  /// Clear data of nekoton storage by key
  Future<void> removeStorageData(String key) =>
      _storage.delete(key, domain: _nekotonBridgeKey);

  /// Clear all data of nekoton storage
  Future<void> clearStorageData() => _storage.clearDomain(_nekotonBridgeKey);

  /// Subject of public keys names
  final _seedNamesSubject = BehaviorSubject<Map<PublicKey, String>>();

  /// Stream of seed names
  Stream<Map<PublicKey, String>> get seedNamesStream => _seedNamesSubject;

  /// Get previously cached seeds names
  Map<PublicKey, String> get seedNames => _seedNamesSubject.value;

  /// Put seed names to stream
  Future<void> _streamedSeedNames() async =>
      _seedNamesSubject.add(await readSeedNames());

  /// Get all names of seeds from storage
  Future<Map<PublicKey, String>> readSeedNames() async =>
      (await _storage.getDomain(domain: _seedsKey)).map(
        (key, value) => MapEntry(
          PublicKey(publicKey: key),
          value,
        ),
      );

  /// Add new or change seed name.
  ///
  /// Seed names a bit different from key names, so it stores here separately.
  Future<void> updateSeedName({
    required PublicKey masterKey,
    required String name,
  }) async {
    await _storage.set(masterKey.publicKey, name, domain: _seedsKey);

    return _streamedSeedNames();
  }

  /// Remove name of seed
  Future<void> removeSeedName(PublicKey masterKey) async {
    await _storage.delete(masterKey.publicKey, domain: _seedsKey);

    return _streamedSeedNames();
  }

  /// Clear information about all names of public keys
  Future<void> clearSeeds() async {
    await _storage.clearDomain(_seedsKey);

    return _seedNamesSubject.add({});
  }

  /// Subject of hidden accounts
  final _hiddenAccountsSubject = BehaviorSubject<List<Address>>();

  /// Get previously cached hidden accounts
  List<Address> get hiddenAccounts => _hiddenAccountsSubject.value;

  /// Stream of hidden accounts
  Stream<List<Address>> get hiddenAccountsStream => _hiddenAccountsSubject;

  /// Put last viewed seeds to stream
  Future<void> _streamedHiddenAccounts() async =>
      _hiddenAccountsSubject.add(await readHiddenAccounts());

  /// Read from storage list of addresses of accounts that were hidden by user
  Future<List<Address>> readHiddenAccounts() async {
    final accounts = await _storage.get(
      _hiddenAccountsKey,
      domain: _accountSeedPreferencesKey,
    );
    if (accounts == null) {
      return [];
    }
    final accountsList = jsonDecode(accounts) as List<dynamic>;

    return accountsList
        .cast<String>()
        .map((address) => Address(address: address))
        .toList();
  }

  /// Hide account addresses so it won't be displayed at accounts list
  Future<void> hideAccounts(List<Address> addresses) async {
    final accounts = await readHiddenAccounts();
    accounts.addAll(addresses);
    await _storage.set(
      _hiddenAccountsKey,
      jsonEncode(accounts.toSet().toList()),
      domain: _accountSeedPreferencesKey,
    );

    return _streamedHiddenAccounts();
  }

  /// Show account addresses so it will be displayed at accounts list
  Future<void> showAccounts(List<Address> addresses) async {
    final accounts = await readHiddenAccounts();
    accounts.removeWhere((a) => addresses.contains(a));
    await _storage.set(
      _hiddenAccountsKey,
      jsonEncode(accounts),
      domain: _accountSeedPreferencesKey,
    );

    await _streamedHiddenAccounts();
  }

  /// Clear information about hidden accounts
  Future<void> clearHiddenAccounts() async {
    await _storage.delete(
      _hiddenAccountsKey,
      domain: _accountSeedPreferencesKey,
    );

    return _hiddenAccountsSubject.add([]);
  }

  /// Subject of external accounts
  final _externalAccountsSubject =
      BehaviorSubject<Map<PublicKey, List<Address>>>();

  /// Get previously cached external accounts
  Map<PublicKey, List<Address>> get externalAccounts =>
      _externalAccountsSubject.value;

  /// Stream of external accounts
  Stream<Map<PublicKey, List<Address>>> get externalAccountsStream =>
      _externalAccountsSubject;

  /// Put last viewed seeds to stream
  Future<void> _streamedExternalAccounts() async =>
      _externalAccountsSubject.add(await readExternalAccounts());

  /// Read from storage external accounts where key - public key,
  /// value - list of addresses of accounts
  Future<Map<PublicKey, List<Address>>> readExternalAccounts() async {
    final accounts = await _storage.getDomain(domain: _externalAccountsKey);

    return accounts.map(
      (key, value) => MapEntry(
        PublicKey(publicKey: key),
        (jsonDecode(value) as List<dynamic>)
            .cast<String>()
            .map((address) => Address(address: address))
            .toList(),
      ),
    );
  }

  /// Add external account for specified [publicKey]
  Future<void> addExternalAccount({
    required PublicKey publicKey,
    required Address address,
  }) async {
    final accountsEncoded = await _storage.get(
      publicKey.publicKey,
      domain: _externalAccountsKey,
    );

    final accounts = accountsEncoded == null
        ? [address]
        : [
            ...(jsonDecode(accountsEncoded) as List<dynamic>).cast<String>(),
            address,
          ];

    await _storage.set(
      publicKey.publicKey,
      jsonEncode(accounts),
      domain: _externalAccountsKey,
    );

    await _streamedExternalAccounts();
  }

  /// Update list of accounts for specified [publicKey].
  Future<void> updateExternalAccounts({
    required PublicKey publicKey,
    required List<String> accounts,
  }) async {
    await _storage.set(
      publicKey.publicKey,
      jsonEncode(accounts),
      domain: _externalAccountsKey,
    );

    return _streamedExternalAccounts();
  }

  /// Remove external account for specified [publicKey]
  Future<void> removeExternalAccounts({
    required PublicKey publicKey,
    required List<Address> addresses,
  }) async {
    final accountsEncoded = await _storage.get(
      publicKey.publicKey,
      domain: _externalAccountsKey,
    );

    final accounts = accountsEncoded == null
        ? List<String>.empty()
        : ((jsonDecode(accountsEncoded) as List<dynamic>).cast<String>())
      ..removeWhere(
        (a) => addresses.map((address) => address.address).contains(a),
      );

    await _storage.set(
      publicKey.publicKey,
      jsonEncode(accounts),
      domain: _externalAccountsKey,
    );

    return _streamedExternalAccounts();
  }

  /// Clear all external accounts
  Future<void> clearExternalAccounts() async {
    await _storage.clearDomain(_externalAccountsKey);

    return _externalAccountsSubject.add({});
  }

  /// Clear information about all preferences
  Future<void> clearPreferences() =>
      _storage.clearDomain(_accountSeedPreferencesKey);
}
