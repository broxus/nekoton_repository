import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'package:nekoton_repository/nekoton_repository.dart';

/// Wrapper class around [KeyAccountBase] account with additional logic.
@immutable
class KeyAccount extends KeyAccountBase {
  const KeyAccount({
    required super.account,
    required super.isExternal,
    required super.isHidden,
    required super.publicKey,
  });

  /// Show this account in wallet page.
  Future<void> show() => GetIt.instance<NekotonRepository>()
      .storageRepository
      .showAccounts([account.address]);

  /// Hide this account from wallet page.
  /// In profile page is still will be visible.
  Future<void> hide() => GetIt.instance<NekotonRepository>()
      .storageRepository
      .hideAccounts([account.address]);

  /// Add token to this account
  Future<void> addTokenWallet(Address rootTokenContract) =>
      GetIt.instance<AccountRepository>().addTokenWallet(
        address: account.address,
        rootTokenContract: rootTokenContract,
      );

  /// Add list of tokens to account
  Future<void> addTokenWallets(List<Address> rootTokenContracts) =>
      GetIt.instance<AccountRepository>().addTokenWallets(
        address: account.address,
        rootTokenContracts: rootTokenContracts,
      );

  /// Remove token from this account
  Future<void> removeTokenWallet(Address rootTokenContract) =>
      GetIt.instance<AccountRepository>().removeTokenWallet(
        address: account.address,
        rootTokenContract: rootTokenContract,
      );

  /// Remove list of tokens from account
  Future<void> removeTokenWallets(List<Address> rootTokenContracts) =>
      GetIt.instance<AccountRepository>().removeTokenWallets(
        address: account.address,
        rootTokenContracts: rootTokenContracts,
      );

  /// Change name of this account to [newName].
  Future<void> rename(String newName) => GetIt.instance<AccountRepository>()
      .renameAccount(account.address, newName);

  /// Remove this account from storage.
  /// This works fine for local and external accounts.
  Future<void> remove() =>
      GetIt.instance<AccountRepository>().removeAccounts([this]);
}
