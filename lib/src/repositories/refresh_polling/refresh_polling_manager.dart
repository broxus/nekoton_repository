import 'package:nekoton_repository/nekoton_repository.dart';

/// Abstract manager that encapsulates all polling logic for wallets.
///
/// Implementations must support both ton and token wallets and allow switching
/// between normal and intensive modes by wallet [Address].
abstract class RefreshPollingManager {
  /// Returns which backend implementation is used.
  RefreshPollingBackend get backend;

  /// Indicates whether polling is globally paused.
  bool get isPaused;

  /// Emits polling pause/resume changes.
  Stream<bool> get isPausedStream;

  /// Register a new wallet polling target.
  void registerTarget(RefreshPollingTarget target);

  /// Unregister a wallet polling target.
  void unregisterTarget(Address address);

  /// Returns true if a target for [address] is registered.
  bool hasTarget(Address address);

  /// Starts polling for a specific wallet [address].
  void startPolling(Address address);

  /// Stops polling for a specific wallet [address] or all wallets if null.
  void stopPolling(Address address);

  /// Stops polling for all wallets.
  void stopPollingAll();

  /// Pauses polling for all wallets.
  void pausePolling();

  /// Resumes polling for all wallets.
  void resumePolling();

  /// Switch polling mode for [address].
  void setPollingMode(Address address, RefreshPollingMode mode);

  /// Clears all registered targets and internal state.
  void clear();

  /// Disposes the manager and releases resources.
  void dispose();
}
