import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  group('AbiLoader', () {
    late _MockAssetBundle bundle;
    late AbiLoader loader;

    setUp(() {
      bundle = _MockAssetBundle();
      loader = AbiLoader(bundle);
    });

    test('loads ABI string using type path', () async {
      const abi = 'abi-data';
      when(
        () => bundle.loadString(AbiType.tip61.path),
      ).thenAnswer((_) async => abi);

      // Act
      final result = await loader.load(AbiType.tip61);

      // Assert
      expect(result, abi);
      verify(() => bundle.loadString(AbiType.tip61.path)).called(1);
    });

    test('reuses cached future for the same ABI type', () async {
      const abi = 'cached-abi';
      when(
        () => bundle.loadString(AbiType.nft.path),
      ).thenAnswer((_) async => abi);

      // Act
      final first = loader.load(AbiType.nft);
      final second = loader.load(AbiType.nft);

      // Assert
      expect(identical(first, second), isTrue);
      expect(await second, abi);
      verify(() => bundle.loadString(AbiType.nft.path)).called(1);
    });

    test('loads each ABI type independently', () async {
      when(
        () => bundle.loadString(AbiType.collection.path),
      ).thenAnswer((_) async => 'collection');
      when(
        () => bundle.loadString(AbiType.tip422Nft.path),
      ).thenAnswer((_) async => 'tip422');

      // Act
      final collection = await loader.load(AbiType.collection);
      final tip422 = await loader.load(AbiType.tip422Nft);

      // Assert
      expect(collection, 'collection');
      expect(tip422, 'tip422');
      verify(() => bundle.loadString(AbiType.collection.path)).called(1);
      verify(() => bundle.loadString(AbiType.tip422Nft.path)).called(1);
    });

    test('propagates bundle errors and keeps failed future cached', () async {
      final exception = Exception('boom');
      when(
        () => bundle.loadString(AbiType.tip43.path),
      ).thenAnswer((_) => Future<String>.error(exception));

      // Act
      final firstFuture = loader.load(AbiType.tip43);

      // Assert
      await expectLater(firstFuture, throwsA(same(exception)));
      final secondFuture = loader.load(AbiType.tip43);
      expect(identical(firstFuture, secondFuture), isTrue);
      await expectLater(secondFuture, throwsA(same(exception)));
      verify(() => bundle.loadString(AbiType.tip43.path)).called(1);
    });
  });
}
