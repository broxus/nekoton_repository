import 'package:equatable/equatable.dart';

import 'package:nekoton_repository/nekoton_repository.dart';

/// [KeyAccountBase] is [KeyAccount] but without any actions.
/// This model allows tracking KeyAccount adding/removing from [SeedList],
/// see [SeedListDiffChange].
class KeyAccountBase extends Equatable {
  const KeyAccountBase({
    required this.account,
    required this.publicKey,
    required this.isExternal,
    required this.isHidden,
  });

  /// Create instance from real account
  factory KeyAccountBase.fromAccount(KeyAccount account) => KeyAccountBase(
        account: account.account,
        publicKey: account.publicKey,
        isExternal: account.isExternal,
        isHidden: account.isHidden,
      );

  /// Nekoton's account
  final AssetsList account;

  /// Key for which this account specified.
  /// For external accounts this value can be different from account.publicKey
  /// but for internal usages this key is same as for key this account stores in
  final PublicKey publicKey;

  /// Flag that allows identify if this account is external.
  final bool isExternal;

  /// Flag that allows identify if this account is hidden.
  final bool isHidden;

  /// Proxy getter of name of account
  String get name => account.name;

  /// Proxy getter of address of account
  Address get address => account.address;

  /// Proxy getter of workchain of account
  int get workchain => account.workchain;

  /// Proxy getter of additional assets of account
  Map<String, AdditionalAssets> get additionalAssets =>
      account.additionalAssets;

  @override
  List<Object?> get props => [account, isExternal, isHidden];
}
