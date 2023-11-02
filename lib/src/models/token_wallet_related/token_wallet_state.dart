import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// State of [TokenWallet] that allows tracking when subscription was created
/// successfully or when it failed with some error.
///
/// To detect which state is active, use [hasWallet] and [hasError].
@immutable
class TokenWalletState extends Equatable {
  /// Create state with error.
  const TokenWalletState.error({
    required Object err,
    required this.owner,
    required this.rootTokenContract,
  })  : wallet = null,
        error = err;

  /// Create state with wallet
  TokenWalletState.wallet(TokenWallet w)
      : error = null,
        owner = w.owner,
        rootTokenContract = w.rootTokenContract,
        wallet = w;

  /// Allows to track for which wallet this state was created.
  /// This can be useful when [wallet] is null and we cannot detect it.
  final Address owner;
  final Address rootTokenContract;

  /// Wallet that could be created.
  /// If wallet was created, then [hasWallet] returns true and you can use it
  /// as usual.
  final TokenWallet? wallet;

  /// Any error that could be thrown during creating subscription.
  /// Typically, this is [FfiException] or
  /// [TokenWalletRetrySubscriptionMissedAsset], but may be any other type.
  final Object? error;

  bool get hasWallet => wallet != null;

  bool get hasError => error != null;

  @override
  List<Object?> get props => [owner, rootTokenContract, error, wallet];
}

/// Exception that will be thrown from any methods when user outside package
/// called method without making sure that state was initialized.
class TokenWalletStateNotInitializedException implements Exception {
  @override
  String toString() => '''
`TokenWalletState.wallet` was not initialized.
Try calling `TokenWalletRepository.retrySubscriptions`
''';
}

/// Exception that will be thrown from
/// [TokenWalletRepository.retryTokenSubscription] when asset with specified
/// owner and rootTokenContract won't be found.
class TokenWalletRetrySubscriptionMissedAsset implements Exception {}
