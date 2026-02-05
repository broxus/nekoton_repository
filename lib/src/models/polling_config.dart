class PollingConfig {
  const PollingConfig({
    required this.tonWalletRefreshInterval,
    required this.tokenWalletRefreshInterval,
    required this.intensivePollingInterval,
    this.sseBaseUrl,
  });

  static const PollingConfig defaultConfig = PollingConfig(
    tonWalletRefreshInterval: Duration(seconds: 10),
    tokenWalletRefreshInterval: Duration(seconds: 10),
    intensivePollingInterval: Duration(seconds: 2),
  );

  final Duration tonWalletRefreshInterval;
  final Duration tokenWalletRefreshInterval;
  final Duration intensivePollingInterval;
  final String? sseBaseUrl;
}
