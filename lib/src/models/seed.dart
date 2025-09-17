import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Any seed of application, that contains [masterPublicKey] and [subKeys].
/// [masterPublicKey] is a main key that derives directly from seed phrase.
/// [subKeys] is a list of keys that derives from [masterPublicKey].
///
/// This instance is immutable and it can't change its state.
/// To listen SeedList changes, use [NekotonRepository.seedListStream]
@immutable
class Seed extends SeedBase {
  Seed({
    required this.masterKey,
    required this.subKeys,
    required this.addType,
    required this.addedAt,
    required String? name,
  }) : _name = name,
       super(
         name: name ?? masterKey.key.masterKey.toEllipseString(),
         masterPublicKey: masterKey.publicKey,
       );

  /// Master key of seed.
  /// This key is derived directly from seed phrase.
  final SeedKey masterKey;

  /// How seed was added (create/import)
  final SeedAddType addType;

  /// When seed was added
  final int addedAt;

  /// Name of seed itself, this name stores in app's storage, not in keystore
  final String? _name;

  /// If seed has name, it will be returned, otherwise master publick key with
  /// ellipsis.
  @override
  String get name => _name ?? masterKey.key.masterKey.toEllipseString();

  /// Proxy getter of public key of master key
  PublicKey get publicKey => masterKey.key.publicKey;

  /// List of derived keys of [masterKey].
  /// This list do not contains [masterKey].
  final List<SeedKey> subKeys;

  /// Just for iterating over all keys.
  List<SeedKey> get allKeys => [masterKey, ...subKeys];

  /// Get instance of SeedKey if [publicKey] is part of this seed.
  SeedKey? findKeyByPublicKey(PublicKey publicKey) =>
      allKeys.firstWhereOrNull((key) => key.publicKey == publicKey);

  /// Returns list of public keys that can be used in [deriveKeys] from [params]
  /// !!! Seed should not be legacy.
  Future<List<PublicKey>> getKeysToDerive(GetPublicKeysParams params) =>
      GetIt.instance<SeedKeyRepository>().getKeysToDerive(params);

  /// Derive keys from [masterKey] this call adds list of sub keys to
  /// [subKeys].
  /// This method returns list of public keys that allows add additional logic
  /// related to newly added keys.
  Future<List<PublicKey>> deriveKeys({
    required List<int> accountIds,
    required String password,
  }) => GetIt.instance<SeedKeyRepository>().deriveKeys(
    params: accountIds.map(
      (accountId) => DeriveKeysParams.derived(
        accountId: accountId,
        masterKey: masterKey.publicKey,
        password: password,
      ),
    ),
  );

  /// Derive key from [masterKey] this call adds list of sub keys to
  /// [subKeys].
  /// This method do not triggers accounts adding
  Future<PublicKey> deriveKey({
    required int accountId,
    required String password,
  }) => GetIt.instance<SeedKeyRepository>().deriveKey(
    params: DeriveKeysParams.derived(
      accountId: accountId,
      masterKey: masterKey.publicKey,
      password: password,
    ),
  );

  /// Change password of seed phrase.
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) => GetIt.instance<SeedKeyRepository>().changeSeedPassword(
    publicKey: masterKey.publicKey,
    oldPassword: oldPassword,
    newPassword: newPassword,
    isLegacy: masterKey.isLegacy,
  );

  /// Return seeds phrase of this seed.
  /// Do not works for ledger key.
  Future<List<String>> export(String password) =>
      GetIt.instance<SeedKeyRepository>().exportSeed(
        masterKey: masterKey.publicKey,
        password: password,
        isLegacy: masterKey.isLegacy,
      );

  /// Rename seed with [masterKey] to [name].
  /// This changes name in storage, not in keystore.
  Future<void> rename({required String name}) =>
      GetIt.instance<SeedKeyRepository>().renameSeed(
        masterKey: publicKey,
        name: name,
      );

  /// This method allows remove full seed and all related keys (master and sub)
  Future<void> remove() {
    GetIt.instance<NekotonRepository>().storageRepository.removeSeedMetadata(
      publicKey,
    );

    return GetIt.instance<SeedKeyRepository>().removeKeys(allKeys);
  }

  @override
  List<Object?> get props => [allKeys, _name];
}
