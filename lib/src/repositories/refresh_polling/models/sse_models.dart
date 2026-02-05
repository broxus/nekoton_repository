import 'package:flutter/foundation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// SSE stream update payload for a wallet address.
@immutable
class SseStreamUpdate {
  /// Creates a stream update model.
  const SseStreamUpdate({
    required this.address,
    required this.maxLt,
    required this.genUtime,
    this.dropped,
  });

  factory SseStreamUpdate.fromJson(Map<String, dynamic> json) {
    final addressValue = json['address'];
    if (addressValue is! String || addressValue.isEmpty) {
      throw const FormatException('SSE update address is missing');
    }

    return SseStreamUpdate(
      address: Address(address: addressValue),
      maxLt: (json['maxLt'] as num).toInt(),
      genUtime: (json['genUtime'] as num).toInt(),
      dropped: (json['dropped'] as num?)?.toInt(),
    );
  }

  /// Wallet address for the update.
  final Address address;

  /// Maximum logical time reported by the server.
  final int maxLt;

  /// Generation time in seconds.
  final int genUtime;

  /// Optional number of dropped updates.
  final int? dropped;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'address': address.address,
    'maxLt': maxLt,
    'genUtime': genUtime,
    if (dropped != null) 'dropped': dropped,
  };
}

/// SSE connection lifecycle state.
enum SseConnectionState {
  /// Connection is not established.
  disconnected,

  /// Connection attempt is in progress.
  connecting,

  /// Connection is established and streaming events.
  connected,

  /// Connection is retrying after an error.
  retrying,
}

/// Backoff policy for SSE reconnect attempts.
@immutable
class SseReconnectPolicy {
  /// Creates an exponential backoff configuration.
  const SseReconnectPolicy({
    required this.minDelay,
    required this.maxDelay,
    required this.factor,
    required this.jitter,
    required this.maxAttempts,
  });

  /// Minimum delay before reconnecting.
  final Duration minDelay;

  /// Maximum delay before reconnecting.
  final Duration maxDelay;

  /// Exponential backoff multiplier.
  final double factor;

  /// Jitter factor applied to backoff delay.
  final double jitter;

  /// Maximum number of consecutive attempts before fallback.
  final int maxAttempts;
}

/// SSE service configuration derived from [PollingConfig].
@immutable
class SseRefreshPollingConfig {
  /// Creates a configuration for SSE polling.
  const SseRefreshPollingConfig({
    required this.baseUrl,
    required this.reconnectPolicy,
  });

  /// Base URL of the SSE service.
  final Uri baseUrl;

  /// Reconnect policy for SSE stream failures.
  final SseReconnectPolicy reconnectPolicy;
}
