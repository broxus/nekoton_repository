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
/// !!! There is no hierarchy between [SeedBase], [SeedKeyBase] and
/// [KeyAccountBase]. This is just a pure data-copy of original models.
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
    final seedDiff = SeedBase.fromSeed(seed);
    final accounts = <KeyAccountBase>[];
    final keys = <SeedKeyBase>[];
    for (final key in seed.allKeys) {
      keys.add(SeedKeyBase.fromKey(key));
      accounts.addAll(
        key.accountList.allAccounts.map(KeyAccountBase.fromAccount),
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
    final keyDiff = SeedKeyBase.fromKey(key);
    final accounts =
        key.accountList.allAccounts.map(KeyAccountBase.fromAccount).toList();

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
    final accountDiff = KeyAccountBase.fromAccount(account);

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
  /// [SeedBase] is just [Seed] where publicKey=masterKey and nothing more.
  /// Seed have have difference only in 1 way:
  /// 1) added/removed itself
  final List<SeedBase> deletedSeeds;
  final List<SeedBase> addedSeeds;

  /// Added and deleted public keys.
  /// [SeedKeyBase] is [SeedKey] (even master key=seed)
  /// Key may have difference in 2 ways:
  /// 1) added/removed itself
  /// 2) added/removed if parent seed added/removed
  final List<SeedKeyBase> deletedKeys;
  final List<SeedKeyBase> addedKeys;

  /// Added and deleted accounts.
  /// [KeyAccountBase] is [KeyAccount] but without any actions.
  /// Account may have difference in 3 ways:
  /// 1) added/removed itself
  /// 2) added/removed if its parent key added/removed
  /// 3) added/removed if its seed added/removed
  final List<KeyAccountBase> deletedAccounts;
  final List<KeyAccountBase> addedAccounts;

  /// Expand this diff by adding unique elements from [other].
  SeedListDiffChange expand(SeedListDiffChange other) {
    return SeedListDiffChange(
      deletedSeeds: <SeedBase>{
        ...other.deletedSeeds,
        ...deletedSeeds,
      }.toList(),
      addedSeeds: <SeedBase>{
        ...other.addedSeeds,
        ...addedSeeds,
      }.toList(),
      deletedKeys: <SeedKeyBase>{
        ...other.deletedKeys,
        ...deletedKeys,
      }.toList(),
      addedKeys: <SeedKeyBase>{
        ...other.addedKeys,
        ...addedKeys,
      }.toList(),
      deletedAccounts: <KeyAccountBase>{
        ...other.deletedAccounts,
        ...deletedAccounts,
      }.toList(),
      addedAccounts: <KeyAccountBase>{
        ...other.addedAccounts,
        ...addedAccounts,
      }.toList(),
    );
  }

  /// Expand this diff by adding all unique elements from [others].
  SeedListDiffChange expandList(Iterable<SeedListDiffChange> others) {
    return SeedListDiffChange(
      deletedSeeds: <SeedBase>{
        ...others.map((e) => e.deletedSeeds).expand((e) => e),
        ...deletedSeeds,
      }.toList(),
      addedSeeds: <SeedBase>{
        ...others.map((e) => e.addedSeeds).expand((e) => e),
        ...addedSeeds,
      }.toList(),
      deletedKeys: <SeedKeyBase>{
        ...others.map((e) => e.deletedKeys).expand((e) => e),
        ...deletedKeys,
      }.toList(),
      addedKeys: <SeedKeyBase>{
        ...others.map((e) => e.addedKeys).expand((e) => e),
        ...addedKeys,
      }.toList(),
      deletedAccounts: <KeyAccountBase>{
        ...others.map((e) => e.deletedAccounts).expand((e) => e),
        ...deletedAccounts,
      }.toList(),
      addedAccounts: <KeyAccountBase>{
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
