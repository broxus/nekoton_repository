import 'package:nekoton_repository/nekoton_repository.dart';

/// Tracks registered polling targets and related SSE subscription state.
class SseRefreshPollingTargets {
  final _targets = <Address, RefreshPollingTarget>{};
  final _activeAddresses = <Address>{};
  final _subscribedAddresses = <Address>{};

  /// Tracks targets currently being refreshed to prevent duplicate refreshes.
  /// Object ref is used to prevent issues with updating target during refresh.
  final _refreshInFlight = <RefreshPollingTarget>{};

  /// Returns true when [address] is registered.
  bool hasTarget(Address address) => _targets.containsKey(address);

  /// Returns true when [address] is actively polled.
  bool isActive(Address address) => _activeAddresses.contains(address);

  /// Returns true when [address] is currently subscribed via SSE.
  bool isSubscribed(Address address) => _subscribedAddresses.contains(address);

  /// All currently active addresses.
  Iterable<Address> get activeAddresses => _activeAddresses;

  /// Registers [target].
  void registerTarget(RefreshPollingTarget target) {
    _targets[target.address] = target;
  }

  /// Unregisters [address] and clears all related state.
  /// Unregistering doesn't remove target from subscribed addresses.
  /// Target should be unsubscribed before unregistering.
  void unregisterTarget(Address address) {
    final target = _targets.remove(address);
    _activeAddresses.remove(address);

    if (target != null) {
      _refreshInFlight.remove(target);
    }
  }

  /// Marks [address] as active.
  void activate(Address address) {
    _activeAddresses.add(address);
  }

  /// Marks [address] as inactive.
  void deactivate(Address address) {
    _activeAddresses.remove(address);
  }

  /// Clears all active addresses.
  void clearActiveAddresses() {
    _activeAddresses.clear();
  }

  /// Clears all subscribed addresses.
  void clearSubscriptions() {
    _subscribedAddresses.clear();
  }

  /// Clears all stored state.
  void clear() {
    _targets.clear();
    _activeAddresses.clear();
    _subscribedAddresses.clear();
    _refreshInFlight.clear();
  }

  /// Returns addresses that still need an SSE subscribe request.
  List<Address> addressesToSubscribe(Iterable<Address> addresses) {
    return addresses
        .where((address) => !_subscribedAddresses.contains(address))
        .toList();
  }

  /// Returns addresses that still need an SSE unsubscribe request.
  List<Address> addressesToUnsubscribe(Iterable<Address> addresses) {
    return addresses.where(_subscribedAddresses.contains).toList();
  }

  /// Marks [addresses] as subscribed.
  void markSubscribed(Iterable<Address> addresses) {
    _subscribedAddresses.addAll(addresses);
  }

  /// Marks [addresses] as unsubscribed.
  void markUnsubscribed(Iterable<Address> addresses) {
    _subscribedAddresses.removeAll(addresses);
  }

  /// Refreshes all active targets.
  void refreshActiveTargets() {
    for (final address in _activeAddresses) {
      refreshTarget(address);
    }
  }

  /// Refreshes the target for [address] unless a refresh is already running.
  void refreshTarget(Address address) {
    final target = _targets[address];
    if (target == null || _refreshInFlight.contains(target)) return;

    _refreshInFlight.add(target);
    target.refresher.refresh().whenComplete(() {
      _refreshInFlight.remove(target);
    });
  }
}
