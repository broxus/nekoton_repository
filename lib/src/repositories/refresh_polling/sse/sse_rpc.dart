import 'package:nekoton_repository/nekoton_repository.dart';

/// RPC client interface for SSE subscription management.
abstract class SseRpcClient {
  /// Subscribe to a batch of wallet [addresses] using [uuid].
  Future<void> subscribe({
    required String uuid,
    required List<Address> addresses,
  });

  /// Unsubscribe from a batch of wallet [addresses] using [uuid].
  Future<void> unsubscribe({
    required String uuid,
    required List<Address> addresses,
  });

  /// Unsubscribe from all addresses for the given [uuid].
  Future<void> unsubscribeAll({required String uuid});
}

/// Abstraction of SSE stream connection and event dispatching.
abstract class SseStreamClient {
  /// Opens an SSE stream and yields decoded events.
  Stream<SseStreamEvent> connect();

  /// Closes any active SSE connection.
  Future<void> close();
}
