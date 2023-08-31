import 'package:equatable/equatable.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// [SeedDiffed] is just [Seed] where publicKey=masterKey and nothing more.
/// This model allows tracking Seed adding/removing from [SeedList],
/// see [SeedListDiffChange].
class SeedDiffed extends Equatable {
  const SeedDiffed({
    required this.masterKey,
    required this.name,
  });

  /// Create instance from real seed
  factory SeedDiffed.fromSeed(Seed seed) => SeedDiffed(
        masterKey: seed.masterKey.publicKey,
        name: seed.name,
      );

  /// Master key of seed.
  /// This key is derived directly from seed phrase.
  final PublicKey masterKey;

  /// Name of seed, this can be name from storage or name from [masterKey]
  final String? name;

  @override
  List<Object?> get props => [masterKey, name];
}
