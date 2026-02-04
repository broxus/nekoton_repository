import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _TestRefresher implements RefreshingInterface {
  const _TestRefresher();

  @override
  Future<void> refresh() async {}

  @override
  String get refreshDescription => 'test-refresher';
}

void main() {
  group('IntervalRefreshPollingManager', () {
    test('starts polling for registered target', () async {
      const config = PollingConfig.defaultConfig;

      final manager = IntervalRefreshPollingManager(pollingConfig: config);
      final target = RefreshPollingTarget(
        address: const Address(address: '0:1'),
        refresher: const _TestRefresher(),
        defaultInterval: config.tonWalletRefreshInterval,
        intensiveInterval: config.intensivePollingInterval,
        debugLabel: 'ton:0:1',
      );

      manager
        ..registerTarget(target)
        ..startPolling(target.address);

      expect(manager.hasTarget(target.address), isTrue);
      expect(manager.backend, RefreshPollingBackend.interval);
    });

    test('switches polling mode to intensive', () async {
      const config = PollingConfig.defaultConfig;

      final manager = IntervalRefreshPollingManager(pollingConfig: config);
      final target = RefreshPollingTarget(
        address: const Address(address: '0:2'),
        refresher: const _TestRefresher(),
        defaultInterval: config.tonWalletRefreshInterval,
        intensiveInterval: config.intensivePollingInterval,
        debugLabel: 'ton:0:2',
      );

      manager
        ..registerTarget(target)
        ..setPollingMode(target.address, RefreshPollingMode.intensive);

      expect(manager.hasTarget(target.address), isTrue);
    });
  });
}
