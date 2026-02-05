import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

void main() {
  group('DefaultRefreshPollingManagerFactory', () {
    test('creates SSE manager when sseUrl is provided', () {
      const config = PollingConfig(
        tonWalletRefreshInterval: Duration(seconds: 10),
        tokenWalletRefreshInterval: Duration(seconds: 10),
        intensivePollingInterval: Duration(seconds: 2),
        sseBaseUrl: 'https://sse.example.com',
      );

      const factory = DefaultRefreshPollingManagerFactory();
      final manager = factory.create(pollingConfig: config);

      expect(manager, isA<SseRefreshPollingManager>());
    });

    test('creates interval manager when sseUrl is empty', () {
      const config = PollingConfig(
        tonWalletRefreshInterval: Duration(seconds: 10),
        tokenWalletRefreshInterval: Duration(seconds: 10),
        intensivePollingInterval: Duration(seconds: 2),
        sseBaseUrl: '',
      );

      const factory = DefaultRefreshPollingManagerFactory();
      final manager = factory.create(pollingConfig: config);

      expect(manager, isA<IntervalRefreshPollingManager>());
    });
  });
}
