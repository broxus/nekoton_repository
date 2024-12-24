import 'package:nekoton_repository/nekoton_repository.dart';

/// Repository that can be used in data-classes related to Accounts.
/// This repository can be used as <AccountRepositoryImpl> or you can add
/// custom logic.
abstract class AccountRepository {
  /// Add account to storage.
  Future<Address> addAccount(AccountToAdd account);

  /// Add list of accounts to storage.
  /// Same as [addAccount] but for multiple accounts.
  Future<List<Address>> addAccounts(List<AccountToAdd> accounts);

  /// Add external account with [address].
  /// If publicKey is not specified, then all public keys will be checked.
  /// Throws an exception if no external accounts were added.
  /// [name] is optional.
  /// This method calls [addAccount] inside.
  Future<void> addExternalAccount({
    required Address address,
    PublicKey? publicKey,
    String? name,
  });

  /// This is a helper function, that calls [removeLocalAccounts] or
  /// [removeExternalAccounts] based on every account status.
  Future<void> removeAccounts(List<KeyAccount> accounts);

  /// Remove only local accounts from storage.
  /// Account is local if [KeyAccount.isExternal] is false
  Future<void> removeLocalAccounts(List<KeyAccount> accounts);

  /// Remove only external accounts from storage.
  /// Account is external if [KeyAccount.isExternal] is true
  Future<void> removeExternalAccounts(List<KeyAccount> accounts);

  /// Change name of account with [address] to [newName].
  Future<void> renameAccount(Address address, String newName);

  /// Add token to [address] with [rootTokenContract].
  Future<void> addTokenWallet({
    required Address address,
    required Address rootTokenContract,
  });

  /// Add list of tokens to [address] with [rootTokenContracts].
  Future<void> addTokenWallets({
    required Address address,
    required List<Address> rootTokenContracts,
  });

  /// Remove token with [rootTokenContract] from [address].
  Future<void> removeTokenWallet({
    required Address address,
    required Address rootTokenContract,
  });

  /// Remove list of tokens with [rootTokenContracts] from [address].
  Future<void> removeTokenWallets({
    required Address address,
    required List<Address> rootTokenContracts,
  });
}
