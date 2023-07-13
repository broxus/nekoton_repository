import 'package:nekoton_repository/nekoton_repository.dart';

const nextBlockTimeout = Duration(seconds: 30);

/// This is a wrapper above TonWallet that lets us using RefreshPollingQueue
/// without crutches in TonWallet.refresh.
class TonWalletGqlBlockPoller implements RefreshingInterface {
  TonWalletGqlBlockPoller({
    required this.tonWallet,
    required this.transport,
  });

  final TonWallet tonWallet;
  final GqlTransport transport;

  String? currentBlockId;

  @override
  Future<void> refresh() async {
    currentBlockId ??=
        (await transport.getLatestBlock(address: tonWallet.address)).id;

    final nextBlockId = await transport.waitForNextBlock(
      currentBlockId: currentBlockId!,
      address: tonWallet.address,
      timeout: nextBlockTimeout,
    );

    final block = await transport.getBlock(id: nextBlockId);

    await tonWallet.handleBlock(block: block);

    currentBlockId = nextBlockId;
  }

  @override
  String get refreshDescription =>
      'TonWallet ${tonWallet.address.address} GQL block poller';
}
