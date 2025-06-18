class PollingConfig {
  const PollingConfig({
    required this.tonWalletRefreshInterval,
    required this.tokenWalletRefreshInterval,
    required this.intensivePollingInterval,
  });

  const PollingConfig.defaultConfig()
      : tonWalletRefreshInterval = const Duration(seconds: 10),
        tokenWalletRefreshInterval = const Duration(seconds: 10),
        intensivePollingInterval = const Duration(seconds: 2);

  final Duration tonWalletRefreshInterval;
  final Duration tokenWalletRefreshInterval;
  final Duration intensivePollingInterval;
}
