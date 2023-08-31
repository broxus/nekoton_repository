import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
@immutable
class SeedListDiffChange extends Equatable {
  const SeedListDiffChange({
    required this.deletedAccounts,
    required this.addedAccounts,
    required this.deletedSeeds,
    required this.addedSeeds,
    required this.deletedKeys,
    required this.addedKeys,
  });

  /// Build diff changes from seed (if whole seed was added or deleted)
  factory SeedListDiffChange.fromSeed({
    required Seed seed,
    required bool isDeleted,
  }) {
    final seedDiff = SeedDiffed.fromSeed(seed);
    final accounts = <KeyAccountDiffed>[];
    final keys = <SeedKeyDiffed>[];
    for (final key in seed.allKeys) {
      keys.add(SeedKeyDiffed.fromKey(key));
      accounts.addAll(
        key.accountList.allAccounts.map(KeyAccountDiffed.fromAccount),
      );
    }

    return SeedListDiffChange(
      deletedSeeds: isDeleted ? [seedDiff] : [],
      addedSeeds: isDeleted ? [] : [seedDiff],
      deletedKeys: isDeleted ? keys : [],
      addedKeys: isDeleted ? [] : keys,
      deletedAccounts: isDeleted ? accounts : [],
      addedAccounts: isDeleted ? [] : accounts,
    );
  }

  /// Build diff changes from seed key (if whole key was added or deleted)
  factory SeedListDiffChange.fromKey({
    required SeedKey key,
    required bool isDeleted,
  }) {
    final keyDiff = SeedKeyDiffed.fromKey(key);
    final accounts =
        key.accountList.allAccounts.map(KeyAccountDiffed.fromAccount).toList();

    return SeedListDiffChange(
      deletedSeeds: const [],
      addedSeeds: const [],
      deletedKeys: isDeleted ? [keyDiff] : [],
      addedKeys: isDeleted ? [] : [keyDiff],
      deletedAccounts: isDeleted ? accounts : [],
      addedAccounts: isDeleted ? [] : accounts,
    );
  }

  /// Build diff changes from key account (if only account was added or deleted)
  factory SeedListDiffChange.fromAccount({
    required KeyAccount account,
    required bool isDeleted,
  }) {
    final accountDiff = KeyAccountDiffed.fromAccount(account);

    return SeedListDiffChange(
      deletedSeeds: const [],
      addedSeeds: const [],
      deletedKeys: const [],
      addedKeys: const [],
      deletedAccounts: isDeleted ? [accountDiff] : [],
      addedAccounts: isDeleted ? [] : [accountDiff],
    );
  }

  /// Empty state, that could be used as initial state or start value during
  static const SeedListDiffChange empty = SeedListDiffChange(
    deletedSeeds: [],
    addedSeeds: [],
    deletedKeys: [],
    addedKeys: [],
    deletedAccounts: [],
    addedAccounts: [],
  );

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

  /// Expand this diff by adding unique elements from [other].
  SeedListDiffChange expand(SeedListDiffChange other) {
    return SeedListDiffChange(
      deletedSeeds:
          <SeedDiffed>{...other.deletedSeeds, ...deletedSeeds}.toList(),
      addedSeeds: <SeedDiffed>{...other.addedSeeds, ...addedSeeds}.toList(),
      deletedKeys:
          <SeedKeyDiffed>{...other.deletedKeys, ...deletedKeys}.toList(),
      addedKeys: <SeedKeyDiffed>{...other.addedKeys, ...addedKeys}.toList(),
      deletedAccounts: <KeyAccountDiffed>{
        ...other.deletedAccounts,
        ...deletedAccounts,
      }.toList(),
      addedAccounts: <KeyAccountDiffed>{
        ...other.addedAccounts,
        ...addedAccounts,
      }.toList(),
    );
  }

  /// Expand this diff by adding all unique elements from [others].
  SeedListDiffChange expandList(Iterable<SeedListDiffChange> others) {
    return SeedListDiffChange(
      deletedSeeds: <SeedDiffed>{
        ...others.map((e) => e.deletedSeeds).expand((e) => e),
        ...deletedSeeds,
      }.toList(),
      addedSeeds: <SeedDiffed>{
        ...others.map((e) => e.addedSeeds).expand((e) => e),
        ...addedSeeds,
      }.toList(),
      deletedKeys: <SeedKeyDiffed>{
        ...others.map((e) => e.deletedKeys).expand((e) => e),
        ...deletedKeys,
      }.toList(),
      addedKeys: <SeedKeyDiffed>{
        ...others.map((e) => e.addedKeys).expand((e) => e),
        ...addedKeys,
      }.toList(),
      deletedAccounts: <KeyAccountDiffed>{
        ...others.map((e) => e.deletedAccounts).expand((e) => e),
        ...deletedAccounts,
      }.toList(),
      addedAccounts: <KeyAccountDiffed>{
        ...others.map((e) => e.addedAccounts).expand((e) => e),
        ...addedAccounts,
      }.toList(),
    );
  }

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
