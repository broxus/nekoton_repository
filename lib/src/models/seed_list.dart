import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// List of seeds that user added into application.
/// This list allows iterating over [seeds] and add/remove seeds.
///
/// This instance is immutable and it can't change its state.
/// To listen SeedList changes, use [NekotonRepository.seedListStream]
@immutable
class SeedList extends Equatable {
  SeedList({
    required List<KeyStoreEntry> allKeys,
    required Map<PublicKey, AccountList> mappedAccounts,
    required Map<PublicKey, SeedMetadata> seedMeta,
  }) : _seedsMap = _mapKeysToSeeds(allKeys, mappedAccounts, seedMeta) {
    _allKeys = _seedsMap.values.expand((seed) => seed.allKeys).toList();
  }

  /// All cached seeds.
  /// This structure uses to simplify searching of seeds.
  /// Key - publicKey of masterKey.
  /// Value - Seed.
  final Map<PublicKey, Seed> _seedsMap;

  /// Get seed by masterKey if it's in list.
  Seed? findSeed(PublicKey masterKey) => _seedsMap[masterKey];

  /// Get seed from list by public key of master key or of sub key.
  Seed? findSeedByAnyPublicKey(PublicKey publicKey) {
    for (final seed in _seedsMap.values) {
      if (seed.findKeyByPublicKey(publicKey) != null) {
        return seed;
      }
    }

    return null;
  }

  /// List of seeds that user added into application.
  /// Every seed is a group of masterKey and its subKeys.
  List<Seed> get seeds => _seedsMap.values.toList();

  /// This is a plane list of all keys(master and sub) in application.
  /// This can be useful sometimes.
  late final List<SeedKey> _allKeys;

  /// Get all public keys from all seeds
  List<PublicKey> get allPublicKeys =>
      _allKeys.map((k) => k.publicKey).toList();

  /// Get [SeedKey] instance by it's publicKey.
  /// This is a heavy operation and must not be called during build.
  /// This method can be helpful in browser.
  ///
  /// Returns found key or null.
  SeedKey? findSeedKey(PublicKey publicKey) =>
      _allKeys.firstWhereOrNull((k) => k.publicKey == publicKey);

  /// Get account instance by it's address.
  /// This is a heavy operation and must not be called during build.
  /// This method can be helpful in browser.
  ///
  /// Returns found account or null.
  KeyAccount? findAccountByAddress(Address accountAddress) {
    for (final key in _allKeys) {
      final found = key.findAccountByAddress(accountAddress);
      if (found != null) return found;
    }

    return null;
  }

  /// Add new seed to application.
  /// Returns publicKey of masterKey of added seed.
  Future<PublicKey> addSeed({
    required List<String> phrase,
    required String password,
    int? accountId,
    int? workchainId,
    MnemonicType? mnemonicType,
    String? name,
  }) =>
      GetIt.instance<SeedKeyRepository>().addSeed(
        phrase: phrase,
        password: password,
        accountId: accountId,
        workchainId: workchainId,
        mnemonicType: mnemonicType,
        name: name,
      );

  /// Encrypt data for external usages.
  /// [publicKey] is key that must be used for signing.
  /// If there is no key for [publicKey], exception will be thrown.
  ///
  /// **Note:** Throws [ArgumentError] if the password is not provided for
  /// encrypted/derived key.
  Future<List<EncryptedData>> encrypt({
    required String data,
    required List<PublicKey> publicKeys,
    required EncryptionAlgorithm algorithm,
    required PublicKey publicKey,
    required SignInputAuth signInputAuth,
  }) {
    final key = _allKeys.firstWhere((k) => k.publicKey == publicKey);

    return GetIt.instance<SeedKeyRepository>().encrypt(
      data: data,
      algorithm: algorithm,
      publicKeys: publicKeys,
      signInput: key.signInput(signInputAuth),
    );
  }

  /// Decrypt data from external usages.
  /// If there is no key for [publicKey], exception will be thrown.
  ///
  /// **Note:** Throws [ArgumentError] if the password is not provided for
  /// encrypted/derived key.
  Future<String> decrypt({
    required EncryptedData data,
    required PublicKey publicKey,
    required SignInputAuth signInputAuth,
  }) {
    final key = _allKeys.firstWhere((k) => k.publicKey == publicKey);

    return GetIt.instance<SeedKeyRepository>().decrypt(
      data: data,
      signInput: key.signInput(signInputAuth),
    );
  }

  /// Sign [message] with [publicKey]
  /// If there is no key for [publicKey], exception will be thrown.
  /// [signatureId] is [Transport.getSignatureId].
  ///
  /// **Note:** Throws [ArgumentError] if the password is not provided for
  /// encrypted/derived key.
  Future<String> sign({
    required UnsignedMessageImpl message,
    required PublicKey publicKey,
    required SignInputAuth signInputAuth,
    required int? signatureId,
  }) {
    final key = _allKeys.firstWhere((k) => k.publicKey == publicKey);

    return GetIt.instance<SeedKeyRepository>().sign(
      message: message,
      signatureId: signatureId,
      signInput: key.signInput(signInputAuth),
    );
  }

  /// Sign [data] message with [publicKey]
  /// If there is no key for [publicKey], exception will be thrown.
  /// [signatureId] is [Transport.getSignatureId].
  ///
  /// **Note:** Throws [ArgumentError] if the password is not provided for
  /// encrypted/derived key.
  Future<SignedData> signData({
    required String data,
    required PublicKey publicKey,
    required SignInputAuth signInputAuth,
    required int? signatureId,
  }) {
    final key = _allKeys.firstWhere((k) => k.publicKey == publicKey);

    return GetIt.instance<SeedKeyRepository>().signData(
      data: data,
      signatureId: signatureId,
      signInput: key.signInput(signInputAuth),
    );
  }

  /// Sign raw [data] message with [publicKey]
  /// If there is no key for [publicKey], exception will be thrown.
  /// [signatureId] is [Transport.getSignatureId].
  ///
  /// **Note:** Throws [ArgumentError] if the password is not provided for
  /// encrypted/derived key.
  Future<SignedDataRaw> signDataRaw({
    required String data,
    required PublicKey publicKey,
    required SignInputAuth signInputAuth,
    required int? signatureId,
  }) {
    final key = _allKeys.firstWhere((k) => k.publicKey == publicKey);

    return GetIt.instance<SeedKeyRepository>().signDataRaw(
      data: data,
      signatureId: signatureId,
      signInput: key.signInput(signInputAuth),
    );
  }

  /// Check if password of [publicKey] equals to [password].
  /// [signatureId] is [Transport.getSignatureId].
  Future<bool> checkKeyPassword({
    required PublicKey publicKey,
    required String password,
    required int? signatureId,
  }) async {
    try {
      // TODO(komarov): check if it is correct
      await signData(
        data: fakeSignature(),
        publicKey: publicKey,
        signatureId: signatureId,
        signInputAuth: SignInputAuth.password(password),
      );

      return true;
    } catch (_) {
      return false;
    }
  }

  /// Return map grouped by masterKey.
  /// Key - publicKey of masterKey.
  /// Value - Seed related to masterKey.
  ///
  /// [mappedAccounts] - key is publicKey of key. value - list of accounts that
  /// related to this key.
  static Map<PublicKey, Seed> _mapKeysToSeeds(
    List<KeyStoreEntry> allKeys,
    Map<PublicKey, AccountList> mappedAccounts,
    Map<PublicKey, SeedMetadata> seedMeta,
  ) {
    /// Key - publicKey of masterKey.
    /// Value - list of all keys that derives from this masterKey.
    /// MasterKey is always first in this list.
    final seeds = <PublicKey, List<KeyStoreEntry>>{};

    for (final key in allKeys) {
      if (seeds.containsKey(key.masterKey)) {
        if (key.isMaster) {
          seeds[key.masterKey]!.insert(0, key);
        } else {
          seeds[key.masterKey]!.add(key);
        }
      } else {
        seeds[key.masterKey] = [key];
      }
    }

    return seeds.map((master, keys) {
      final meta = seedMeta[master];

      return MapEntry(
        master,
        Seed(
          name: meta?.name,
          addType: meta?.addType ?? SeedAddType.create,
          addedAt: meta?.addedAt ?? 0,
          masterKey: SeedKey(
            key: keys.first,
            accountList: mappedAccounts[keys.first.publicKey] ??
                AccountList.empty(keys.first.publicKey),
          ),
          subKeys: keys
              .sublist(1)
              .map(
                (key) => SeedKey(
                  key: key,
                  accountList: mappedAccounts[key.publicKey] ??
                      AccountList.empty(key.publicKey),
                ),
              )
              .toList()
            ..sort(
              (a, b) => a.key.accountId.compareTo(b.key.accountId),
            ),
        ),
      );
    });
  }

  @override
  List<Object?> get props => [_seedsMap];
}
