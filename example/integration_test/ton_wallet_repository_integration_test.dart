import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

import 'timeout_utils.dart';

class MockKeystore extends Mock implements KeyStore {}

class MockTransport extends Mock implements TransportStrategy {}

class MockWalletStorage extends Mock implements TonWalletTransactionsStorage {}

class MockGqlTransport extends Mock implements GqlTransport {}

class MockJrpcTransport extends Mock implements JrpcTransport {}

class TonWalletRepoTest with TonWalletRepositoryImpl {
  TonWalletRepoTest(
    this.currentTransport,
    this.keyStore,
    this.tonWalletStorage,
  );

  @override
  final MockTransport currentTransport;

  @override
  final MockKeystore keyStore;

  @override
  final MockWalletStorage tonWalletStorage;
}

Future<String> postTransportData({
  required String endpoint,
  required Map<String, String> headers,
  required String data,
}) async {
  final response = await http.post(
    Uri.parse(endpoint),
    headers: headers,
    body: data,
  );

  return response.body;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const name = 'Mainnet (GQL)';
  const networkId = 1;
  const networkGroup = 'mainnet';
  const endpoint = 'https://jrpc.everwallet.net/rpc';

  /// System account address
  const multisigAddress = Address(
    address:
        '0:91b689ad990660249eb00140577e6a98d70043ccaa7f63acfc0436336bdbd80f',
  );

  const multisigKey1 = PublicKey(
    publicKey:
        'aa693399a5fa114e2c0345dd6dcbfd1bb6f334e78b5fedb8c980d28dda6715cf',
  );
  const multisigKey1Entry = KeyStoreEntry(
    signerName: '',
    name: '',
    publicKey: multisigKey1,
    masterKey: multisigKey1,
    accountId: 0,
  );
  const multisigKey2 = PublicKey(
    publicKey:
        'bb9c2578a1b9d0c7a6c947c419afe61c691052ff459df65e3eb4375faf3b25c6',
  );
  const multisigKey2Entry = KeyStoreEntry(
    signerName: '',
    name: '',
    publicKey: multisigKey2,
    masterKey: multisigKey2,
    accountId: 0,
  );

  const notMultisigKey = PublicKey(
    publicKey:
        'ad158ac64c5deff5abd4d5e86a81d954716445c45e31f17a9dfe780f9cef7602',
  );
  const notMultisigKeyEntry = KeyStoreEntry(
    signerName: '',
    name: '',
    publicKey: notMultisigKey,
    masterKey: notMultisigKey,
    accountId: 0,
  );

  const notMultisigAddress = Address(
    address:
        '0:d92c91860621eb5397957ee3f426860e2c21d7d4410626885f35db88a46a87c2',
  );

  late MockKeystore keystore;
  late MockTransport transport;
  late MockWalletStorage storage;

  late TonWalletRepoTest repository;

  const jrpcSettings = JrpcNetworkSettings(endpoint: endpoint);
  late JrpcConnection connection;
  late JrpcTransport jrpc;

  setUp(() async {
    // This setup thing SHOULD NOT be removed or altered because it used in
    // integration tests
    // ignore: unawaited_futures
    setupLogger(
      level: LogLevel.Trace,
      mobileLogger: false,
      logHandler: (logEntry) => debugPrint(
        // ignore: lines_longer_than_80_chars
        'FromLib: ${logEntry.level} ${logEntry.tag} ${logEntry.msg} (lib_time=${logEntry.timeMillis})',
      ),
    );

    runApp(Container());

    await initRustToDartCaller();

    connection = await JrpcConnection.create(
      post: postTransportData,
      settings: jrpcSettings,
      name: name,
      group: networkGroup,
      networkId: networkId,
    );
    jrpc = await JrpcTransport.create(jrpcConnection: connection);

    transport = MockTransport();
    storage = MockWalletStorage();
    keystore = MockKeystore();
    repository = TonWalletRepoTest(transport, keystore, storage);
  });

  group('getLocalCustodians', () {
    testWidgets('Get only one local custodian', (tester) async {
      await tester.pumpAndSettleWithTimeout();

      when(() => transport.transport).thenReturn(jrpc);
      when(() => keystore.keys).thenReturn([multisigKey1Entry]);

      await repository.subscribeByAddress(multisigAddress);
      final local = repository.getLocalCustodians(multisigAddress);
      expect(local, [multisigKey1]);
    });

    testWidgets('Get several local custodian', (tester) async {
      await tester.pumpAndSettleWithTimeout();

      when(() => transport.transport).thenReturn(jrpc);
      when(() => keystore.keys)
          .thenReturn([multisigKey1Entry, multisigKey2Entry]);

      await repository.subscribeByAddress(multisigAddress);
      final local = repository.getLocalCustodians(multisigAddress);
      expect(local, [multisigKey1, multisigKey2]);
    });

    testWidgets('Return null custodians for not multisig ', (tester) async {
      await tester.pumpAndSettleWithTimeout();

      when(() => transport.transport).thenReturn(jrpc);
      when(() => keystore.keys).thenReturn([notMultisigKeyEntry]);

      await repository.subscribeByAddress(notMultisigAddress);
      final local = repository.getLocalCustodians(notMultisigAddress);
      expect(local, isNull);
    });
  });

  group('getLocalCustodiansAsync', () {
    testWidgets('Get only one local custodian', (tester) async {
      await tester.pumpAndSettleWithTimeout();

      when(() => transport.transport).thenReturn(jrpc);
      when(() => keystore.keys).thenReturn([multisigKey1Entry]);

      final local = await repository.getLocalCustodiansAsync(multisigAddress);
      expect(local, [multisigKey1]);
    });

    testWidgets('Get several local custodian', (tester) async {
      await tester.pumpAndSettleWithTimeout();

      when(() => transport.transport).thenReturn(jrpc);
      when(() => keystore.keys)
          .thenReturn([multisigKey1Entry, multisigKey2Entry]);

      final local = await repository.getLocalCustodiansAsync(multisigAddress);
      expect(local, [multisigKey1, multisigKey2]);
    });

    testWidgets('Return null custodians for not multisig ', (tester) async {
      await tester.pumpAndSettleWithTimeout();

      when(() => transport.transport).thenReturn(jrpc);
      when(() => keystore.keys).thenReturn([notMultisigKeyEntry]);

      final local =
          await repository.getLocalCustodiansAsync(notMultisigAddress);
      expect(local, isNull);
    });
  });
}
