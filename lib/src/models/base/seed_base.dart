import 'package:equatable/equatable.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// [SeedBase] is just [Seed] where publicKey=masterKey and nothing more.
/// This model allows tracking Seed adding/removing from [SeedList],
/// see [SeedListDiffChange].
class SeedBase extends Equatable {
  const SeedBase({required this.masterPublicKey, required this.name});

  /// Create instance from real seed
  factory SeedBase.fromSeed(Seed seed) =>
      SeedBase(masterPublicKey: seed.masterKey.publicKey, name: seed.name);

  /// Master key of seed.
  /// This key is derived directly from seed phrase.
  final PublicKey masterPublicKey;

  /// Name of seed, this can be name from storage or name from [masterPublicKey]
  final String? name;

  @override
  List<Object?> get props => [masterPublicKey, name];
}
