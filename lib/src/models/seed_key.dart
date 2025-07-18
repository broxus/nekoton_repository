import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Wrapper class for [KeyStoreEntry] that helps storing accounts and interact
/// with key.
@immutable
class SeedKey extends SeedKeyBase {
  const SeedKey({
    required super.key,
    required this.accountList,
  });

  /// List of accounts that specified for this [key]
  final AccountList accountList;

  /// Get account instance by it's address.
  /// This is a heavy operation and must not be called during build.
  /// This method can be helpful in browser.
  ///
  /// Returns found account or null.
  KeyAccount? findAccountByAddress(Address accountAddress) {
    for (final account in accountList.allAccounts) {
      if (account.account.address == accountAddress) {
        return account;
      }
    }

    return null;
  }

  /// This method allows removing only sub key.
  /// If you need remove seed, use [Seed.remove].
  /// Returns true, if key was removed.
  Future<bool> remove() async {
    final removed =
        await GetIt.instance<SeedKeyRepository>().removeKeys([this]);

    return removed.isNotEmpty;
  }

  /// Rename this key (sub or master) to [name].
  ///
  /// This renames only key instance, to rename Seed, see [Seed.rename]
  Future<void> rename({required String name}) =>
      GetIt.instance<SeedKeyRepository>().renameKey(
        publicKey: key.publicKey,
        masterKey: key.masterKey,
        name: name,
      );

  /// Input that can be used to decrypt/encrypt methods.
  ///
  /// **Note:** Throws [ArgumentError] if the [signerType] is not
  /// matching [signInputAuth].
  SignInput signInput(SignInputAuth signInputAuth) {
    return switch (signerType) {
      KeySignerType.encrypted when signInputAuth is SignInputAuthPassword =>
        EncryptedKeyPassword(
          publicKey: key.publicKey,
          password: Password.explicit(
            PasswordExplicit(
              password: signInputAuth.password,
              cacheBehavior: const PasswordCacheBehavior.nop(),
            ),
          ),
        ),
      KeySignerType.derived when signInputAuth is SignInputAuthPassword =>
        DerivedKeyPassword.byAccountId(
          DerivedKeyPasswordByAccountId(
            masterKey: key.masterKey,
            accountId: key.accountId,
            password: Password.explicit(
              PasswordExplicit(
                password: signInputAuth.password,
                cacheBehavior: const PasswordCacheBehavior.nop(),
              ),
            ),
          ),
        ),
      KeySignerType.ledger when signInputAuth is SignInputAuthLedger =>
        LedgerSignInput(
          publicKey: key.publicKey,
          wallet: signInputAuth.wallet,
          context: signInputAuth.context,
        ),
      _ => throw ArgumentError(
          'Cannot create sign input for key with type $signerType. '
          'SignInputAuth type mismatch.',
        ),
    };
  }

  /// Returns list of Accounts that were already created for this key.
  /// !!! Returns not sorted for UI list.
  List<WalletType> get createdAccountTypes =>
      accountList.allAccounts.map((e) => e.account.tonWallet.contract).toList();

  /// Returns list of Accounts that can be created for this key in scope of
  /// current active transport.
  /// availableForTransport\created=availableForCreation.
  ///
  /// !!! Returns not sorted for UI list.
  List<WalletType> get availableForCreationAccountTypes {
    final created = createdAccountTypes;
    final availableForTransport = GetIt.instance<TransportRepository>()
        .currentTransport
        .availableWalletTypes;

    return availableForTransport.where((a) => !created.contains(a)).toList();
  }

  @override
  List<Object?> get props => [key, accountList];
}
