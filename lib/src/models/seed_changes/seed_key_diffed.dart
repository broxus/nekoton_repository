import 'package:equatable/equatable.dart';

import 'package:nekoton_repository/nekoton_repository.dart';

/// [SeedKeyDiffed] is [SeedKey] (even master key=seed).
/// This model allows tracking SeedKey adding/removing from [SeedList],
/// see [SeedListDiffChange].
class SeedKeyDiffed extends Equatable {
  const SeedKeyDiffed({required this.key});

  /// Create instance from real key
  factory SeedKeyDiffed.fromKey(SeedKey key) => SeedKeyDiffed(key: key.key);

  /// Real key from blockchain
  final KeyStoreEntry key;

  /// Proxy getter of name of key
  String get name => key.name;

  /// Proxy getter of public key of key
  PublicKey get publicKey => key.publicKey;

  /// Proxy getter of master flag of key
  bool get isMaster => key.isMaster;

  /// Proxy getter of legacy flag of key
  bool get isLegacy => key.isLegacy;

  @override
  List<Object?> get props => [key];
}
