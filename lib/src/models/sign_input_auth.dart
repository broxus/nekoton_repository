import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'sign_input_auth.freezed.dart';

@freezed
sealed class SignInputAuth with _$SignInputAuth {
  const SignInputAuth._();

  const factory SignInputAuth.password(String password) = SignInputAuthPassword;

  /// The context is only required for wallet deployment, transfers
  /// and transaction confirmation.
  const factory SignInputAuth.ledger({
    required WalletType wallet,
    LedgerSignatureContext? context,
  }) = SignInputAuthLedger;

  bool get isLedger => this is SignInputAuthLedger;
}
