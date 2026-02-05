import 'package:flutter/foundation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Defines supported polling backends for wallet refreshes.
enum RefreshPollingBackend {
  /// Interval-based polling using local timers.
  interval,

  /// Server-Sent Events (SSE) based polling with RPC subscriptions.
  sse,
}

/// Defines polling intensity for a specific wallet address.
enum RefreshPollingMode {
  /// Normal polling interval.
  normal,

  /// Intensive polling interval for short-lived high-activity periods.
  intensive,
}

/// Metadata required to register a wallet in the polling manager.
@immutable
class RefreshPollingTarget {
  /// Creates a new polling target.
  const RefreshPollingTarget({
    required this.address,
    required this.refresher,
    required this.defaultInterval,
    required this.intensiveInterval,
    this.debugLabel,
  });

  /// Wallet address used as a polling key.
  final Address address;

  /// Refreshing interface used to request wallet updates.
  final RefreshingInterface refresher;

  /// Default interval for polling this wallet.
  final Duration defaultInterval;

  /// Intensive interval for polling this wallet.
  final Duration intensiveInterval;

  /// Optional label for logging and diagnostics.
  final String? debugLabel;
}
