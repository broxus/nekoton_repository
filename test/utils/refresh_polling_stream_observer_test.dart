// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/utils/refresh_polling_stream_observer.dart';

class _MockRefreshPollingManager extends Mock
    implements RefreshPollingManager {}

void main() {
  const address = Address(address: '0:observer');

  setUpAll(() {
    registerFallbackValue(const Address(address: '0:fallback'));
  });

  group('TonWalletStreamObserver', () {
    late RefreshPollingManager pollingManager;

    setUp(() {
      pollingManager = _MockRefreshPollingManager();
      when(() => pollingManager.startPolling(any())).thenReturn(null);
      when(() => pollingManager.stopPolling(any())).thenReturn(null);
    });

    test('starts polling when external listeners appear', () {
      // Arrange
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      observer.onStreamListenersChanged(5);

      // Assert
      verify(() => pollingManager.startPolling(address)).called(1);
      verifyNever(() => pollingManager.stopPolling(any()));
    });

    test('does not start polling when only internal listeners exist', () {
      // Arrange
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      observer.onStreamListenersChanged(4);

      // Assert
      verifyNever(() => pollingManager.startPolling(any()));
      verifyNever(() => pollingManager.stopPolling(any()));
    });

    test('stops polling when external listeners drop to internal count', () {
      // Arrange
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      observer
        ..onStreamListenersChanged(5)
        ..onStreamListenersChanged(4);

      // Assert
      verify(() => pollingManager.startPolling(address)).called(1);
      verify(() => pollingManager.stopPolling(address)).called(1);
    });

    test('start polling is idempotent for repeated listener updates', () {
      // Arrange
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      observer
        ..onStreamListenersChanged(5)
        ..onStreamListenersChanged(6);

      // Assert
      verify(() => pollingManager.startPolling(address)).called(1);
      verifyNever(() => pollingManager.stopPolling(any()));
    });

    test('dispose stops polling after activation', () {
      // Arrange
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      observer
        ..onStreamListenersChanged(5)
        ..dispose();

      // Assert
      verify(() => pollingManager.startPolling(address)).called(1);
      verify(() => pollingManager.stopPolling(address)).called(1);
    });

    test('dispose does nothing when polling was never started', () {
      // Arrange
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      observer.dispose();

      // Assert
      verifyNever(() => pollingManager.startPolling(any()));
      verifyNever(() => pollingManager.stopPolling(any()));
    });

    test('propagates errors from polling manager', () {
      // Arrange
      when(
        () => pollingManager.startPolling(address),
      ).thenThrow(StateError('failed to start'));
      final observer = RefreshPollingStreamObserver(
        address: address,
        refreshPollingManager: pollingManager,
        internalListenersCount: 4,
      );

      // Act
      // Assert
      expect(
        () => observer.onStreamListenersChanged(5),
        throwsA(isA<StateError>()),
      );
      verify(() => pollingManager.startPolling(address)).called(1);
      verifyNever(() => pollingManager.stopPolling(any()));
    });
  });
}
