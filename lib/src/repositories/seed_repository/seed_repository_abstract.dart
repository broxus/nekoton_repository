import 'package:nekoton_repository/nekoton_repository.dart';

/// Repository that can be used in data-classes related to Seeds/Keys.
/// This repository can be used as <SeedKeyRepositoryImpl> or you can add
/// custom logic.
abstract class SeedKeyRepository {
  /// Set of public keys that are currently scanning for existing wallets.
  Set<String> get findingExistingWallets;

  /// Stream to listen for changes in [findingExistingWallets].
  Stream<Set<String>> get findingExistingWalletsStream;

  /// Set of master keys that are currently scanning for derived keys
  /// with existing wallets.
  Set<String> get findingDerivedKeys;

  /// Stream to listen for changes in [findingDerivedKeys].
  Stream<Set<String>> get findingDerivedKeysStream;

  /// Returns list of public keys that can be used in [deriveKeys] from [params]
  /// !!! Seed should not be legacy.
  Future<List<PublicKey>> getKeysToDerive(GetPublicKeysParams params);

  /// Streamed version of [getKeysToDerive] optimized for Ledger.
  Stream<PublicKey> getKeysToDeriveStream(GetPublicKeysParams params);

  /// Derive keys from [params].
  /// !!! This method won't work for legacy keys.
  /// This method returns list of public keys that allows add additional logic
  /// related to newly added keys.
  Future<List<PublicKey>> deriveKeys({
    required Iterable<DeriveKeysParams> params,
    bool addActiveAccounts,
  });

  /// Derive key from [params].
  /// !!! This method won't work for legacy keys.
  /// This method do not triggers accounts adding
  Future<PublicKey> deriveKey({
    required DeriveKeysParams params,
    bool addActiveAccounts,
  });

  /// Add new seed to application.
  /// Returns publicKey of masterKey of added seed.
  Future<PublicKey> addSeed({
    required List<String> phrase,
    required String password,
    MnemonicType? mnemonicType,
    String? name,
    SeedAddType addType,
  });

  Future<PublicKey> addLedgerKey({required int accountId, String? name});

  /// Change password of seed phrase.
  Future<void> changeSeedPassword({
    required PublicKey publicKey,
    required String oldPassword,
    required String newPassword,
    required bool isLegacy,
  });

  /// Rename key (sub or master) with [publicKey] to [name].
  Future<void> renameKey({
    required PublicKey publicKey,
    required PublicKey masterKey,
    required String name,
  });

  /// Rename seed with [masterKey] to [name].
  /// This changes name in storage, not in keystore.
  Future<void> renameSeed({required PublicKey masterKey, required String name});

  /// Return seeds phrase of [masterKey].
  /// Do not works for ledger key.
  Future<List<String>> exportSeed({
    required PublicKey masterKey,
    required String password,
    required bool isLegacy,
  });

  /// Encrypt data for external usages.
  /// [signInput] can be get from [SeedKey.signInput].
  Future<List<EncryptedData>> encrypt({
    required String data,
    required List<PublicKey> publicKeys,
    required EncryptionAlgorithm algorithm,
    required SignInput signInput,
  });

  /// Decrypt data from external usages.
  /// [signInput] can be get from [SeedKey.signInput].
  Future<String> decrypt({
    required EncryptedData data,
    required SignInput signInput,
  });

  /// Sign [message] with key it was called on.
  /// [signatureId] is [Transport.getSignatureId].
  /// [signInput] can be get from [SeedKey.signInput].
  Future<String> sign({
    required UnsignedMessageImpl message,
    required SignInput signInput,
    required int? signatureId,
  });

  /// Sign [data] message with key it was called on.
  /// [signatureId] is [Transport.getSignatureId].
  /// [signInput] can be get from [SeedKey.signInput].
  Future<SignedData> signData({
    required String data,
    required SignInput signInput,
    required int? signatureId,
  });

  /// Sign raw [data] message with key it was called on.
  /// [signatureId] is [Transport.getSignatureId].
  /// [signInput] can be get from [SeedKey.signInput].
  Future<SignedDataRaw> signRawData({
    required String data,
    required SignInput signInput,
    required int? signatureId,
  });

  /// Remove keys from keystore and return public keys that were deleted
  Future<List<PublicKey>> removeKeys(List<SeedKey> keys);
}
