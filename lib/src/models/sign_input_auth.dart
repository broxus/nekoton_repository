import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart'
    show LedgerSignatureContext;

part 'sign_input_auth.freezed.dart';

@freezed
sealed class SignInputAuth with _$SignInputAuth {
  const factory SignInputAuth.password(String password) = SignInputAuthPassword;

  const factory SignInputAuth.ledger(LedgerSignatureContext context) =
      SignInputAuthLedger;
}
