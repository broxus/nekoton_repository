import 'package:equatable/equatable.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Model that displays changes between 2 versions of [SeedList].
/// This changes calculates in [NekotonRepository] and put all related data
/// here.
/// If you see this changes, then it's already appeared and you cannot affect
/// for this action.
///
/// You also cannot call any action for instances of this diff.
///
/// !!! There is no hierarchy between [SeedDiffed], [SeedKeyDiffed] and
/// [KeyAccountDiffed]. This is just a pure data-copy of original models.
///
/// !!! This is different only between 2 states, there is no long-time tracking.
class SeedListDiffChange extends Equatable {
  const SeedListDiffChange({
    required this.deletedAccounts,
    required this.addedAccounts,
    required this.deletedSeeds,
    required this.addedSeeds,
    required this.deletedKeys,
    required this.addedKeys,
  });

  /// Added and deleted seeds.
  /// [SeedDiffed] is just [Seed] where publicKey=masterKey and nothing more.
  /// Seed have have difference only in 1 way:
  /// 1) added/removed itself
  final List<SeedDiffed> deletedSeeds;
  final List<SeedDiffed> addedSeeds;

  /// Added and deleted public keys.
  /// [SeedKeyDiffed] is [SeedKey] (even master key=seed)
  /// Key may have difference in 2 ways:
  /// 1) added/removed itself
  /// 2) added/removed if parent seed added/removed
  final List<SeedKeyDiffed> deletedKeys;
  final List<SeedKeyDiffed> addedKeys;

  /// Added and deleted accounts.
  /// [KeyAccountDiffed] is [KeyAccount] but without any actions.
  /// Account may have difference in 3 ways:
  /// 1) added/removed itself
  /// 2) added/removed if its parent key added/removed
  /// 3) added/removed if its seed added/removed
  final List<KeyAccountDiffed> deletedAccounts;
  final List<KeyAccountDiffed> addedAccounts;

  @override
  List<Object?> get props => [
        deletedSeeds,
        addedSeeds,
        deletedKeys,
        addedKeys,
        deletedAccounts,
        addedAccounts,
      ];
}
