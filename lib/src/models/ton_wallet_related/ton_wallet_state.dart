import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// State of [TonWallet] that allows tracking when subscription was created
/// successfully or when it failed with some error.
///
/// To detect which state is active, use [hasWallet] and [hasError].
@immutable
class TonWalletState extends Equatable {
  /// Create state with error.
  const TonWalletState.error({required Object err, required this.address})
    : wallet = null,
      error = err;

  /// Create state with wallet
  TonWalletState.wallet(TonWallet w)
    : error = null,
      address = w.address,
      wallet = w;

  /// Allows to track for which wallet this state was created.
  /// This can be useful when [wallet] is null and we cannot detect it.
  final Address address;

  /// Wallet that could be created.
  /// If wallet was created, then [hasWallet] returns true and you can use it
  /// as usual.
  final TonWallet? wallet;

  /// Any error that could be thrown during creating subscription.
  final Object? error;

  bool get hasWallet => wallet != null;

  bool get hasError => error != null;

  @override
  List<Object?> get props => [address, error, wallet];
}

/// Exception that will be thrown from any methods when user outside package
/// called method without making sure that state was initialized.
class TonWalletStateNotInitializedException implements Exception {
  const TonWalletStateNotInitializedException({
    required this.address,
    this.subscriptionError,
  });

  final Address address;
  final Object? subscriptionError;

  @override
  String toString() =>
      '''
`TonWalletState.wallet` was not initialized. Address: $address.
${subscriptionError != null ? 'Subscription error: $subscriptionError.' : ''}
''';
}

/// Exception that will be thrown from [TonWalletRepository.retrySubscriptions]
/// when asset with specified address won't be found
class TonWalletRetrySubscriptionMissedAsset implements Exception {}
