import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/sse/sse_refresh_polling_targets.dart';

class _CountingRefresher implements RefreshingInterface {
  _CountingRefresher({Completer<void>? completer}) : _completer = completer;

  final Completer<void>? _completer;
  int refreshCalls = 0;

  @override
  Future<void> refresh() async {
    refreshCalls += 1;
    await _completer?.future;
  }

  @override
  String get refreshDescription => 'counting-refresher';
}

RefreshPollingTarget _buildTarget({
  required String address,
  required RefreshingInterface refresher,
}) {
  return RefreshPollingTarget(
    address: Address(address: address),
    refresher: refresher,
    defaultInterval: const Duration(seconds: 10),
    intensiveInterval: const Duration(seconds: 2),
    debugLabel: address,
  );
}

void main() {
  group('SseRefreshPollingTargets', () {
    test('tracks registered and active targets', () {
      final targets = SseRefreshPollingTargets();
      final target = _buildTarget(
        address: '0:1',
        refresher: _CountingRefresher(),
      );

      targets
        ..registerTarget(target)
        ..activate(target.address);

      expect(targets.hasTarget(target.address), isTrue);
      expect(targets.isActive(target.address), isTrue);
      expect(targets.activeAddresses, contains(target.address));

      targets.unregisterTarget(target.address);

      expect(targets.hasTarget(target.address), isFalse);
      expect(targets.isActive(target.address), isFalse);
    });

    test('filters subscribe and unsubscribe batches', () {
      final targets = SseRefreshPollingTargets();
      final firstTarget = _buildTarget(
        address: '0:1',
        refresher: _CountingRefresher(),
      );
      final secondTarget = _buildTarget(
        address: '0:2',
        refresher: _CountingRefresher(),
      );

      targets
        ..registerTarget(firstTarget)
        ..registerTarget(secondTarget)
        ..markSubscribed([firstTarget.address]);

      expect(
        targets.addressesToSubscribe([
          firstTarget.address,
          secondTarget.address,
        ]),
        [secondTarget.address],
      );
      expect(
        targets.addressesToUnsubscribe([
          firstTarget.address,
          secondTarget.address,
        ]),
        [firstTarget.address],
      );

      targets
        ..markUnsubscribed([firstTarget.address])
        ..clearSubscriptions();

      expect(
        targets.addressesToUnsubscribe([
          firstTarget.address,
          secondTarget.address,
        ]),
        isEmpty,
      );
    });

    test('coalesces in-flight refreshes for a single target', () async {
      final refreshCompleter = Completer<void>();
      final refresher = _CountingRefresher(completer: refreshCompleter);
      final target = _buildTarget(address: '0:1', refresher: refresher);
      final targets = SseRefreshPollingTargets()
        ..registerTarget(target)
        ..refreshTarget(target.address)
        ..refreshTarget(target.address);

      await Future<void>.delayed(Duration.zero);

      expect(refresher.refreshCalls, 1);

      refreshCompleter.complete();
      await Future<void>.delayed(Duration.zero);

      targets.refreshTarget(target.address);
      await Future<void>.delayed(Duration.zero);

      expect(refresher.refreshCalls, 2);
    });

    test('refreshes each active target once', () async {
      final firstRefresher = _CountingRefresher();
      final secondRefresher = _CountingRefresher();
      final firstTarget = _buildTarget(
        address: '0:1',
        refresher: firstRefresher,
      );
      final secondTarget = _buildTarget(
        address: '0:2',
        refresher: secondRefresher,
      );
      final targets = SseRefreshPollingTargets()
        ..registerTarget(firstTarget)
        ..registerTarget(secondTarget)
        ..activate(firstTarget.address)
        ..activate(secondTarget.address)
        ..refreshActiveTargets();
      await Future<void>.delayed(Duration.zero);

      expect(firstRefresher.refreshCalls, 1);
      expect(secondRefresher.refreshCalls, 1);

      targets
        ..deactivate(firstTarget.address)
        ..refreshActiveTargets();
      await Future<void>.delayed(Duration.zero);

      expect(firstRefresher.refreshCalls, 1);
      expect(secondRefresher.refreshCalls, 2);
    });
  });
}
