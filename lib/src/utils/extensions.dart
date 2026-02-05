import 'package:money2/money2.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/utils/ntp_time.dart';

extension NumExtension on num {
  BigInt toNativeToken([int decimals = 9]) {
    final factor = BigInt.from(10).pow(decimals);
    return BigInt.from(this * factor.toDouble());
  }
}

extension ExistingWalletInfoX on ExistingWalletInfo {
  /// Check if account is deployed or has money on balance.
  bool get isActive {
    final isDeployed = contractState.isDeployed;
    final balanceIsGreaterThanZero = contractState.balance > BigInt.zero;

    return isDeployed || balanceIsGreaterThanZero;
  }
}

extension SymbolX on Symbol {
  Currency toCurrency({bool register = true}) {
    final patternDigits = decimals > 0 ? '0.${'#' * decimals}' : '0';
    final currency = Currency.create(
      name,
      decimals,
      symbol: name,
      pattern: patternDigits,
      name: fullName,
    );

    if (register) {
      Currencies().register(currency);
    }

    return currency;
  }
}

extension TonWalletTransactionExtension
    on TransactionWithData<TransactionAdditionalInfo?> {
  Address? get dataSender {
    return switch (data) {
      TransactionAdditionalInfoWalletInteraction(:final data) =>
        switch (data.knownPayload) {
          KnownPayloadTokenSwapBack(:final data) => data.callbackAddress,
          _ => null,
        },
      _ => null,
    };
  }

  Address? get dataRecipient {
    final data = switch (this.data) {
      TransactionAdditionalInfoWalletInteraction(:final data) => data,
      _ => null,
    };

    if (data == null) return null;

    if (data.knownPayload != null &&
        data.knownPayload is KnownPayloadTokenOutgoingTransfer) {
      final knownPayload =
          data.knownPayload! as KnownPayloadTokenOutgoingTransfer;

      return knownPayload.data.to.data;
    }

    if (data.method is WalletInteractionMethodMultisig) {
      final method = data.method as WalletInteractionMethodMultisig;
      final dest = switch (method.data) {
        MultisigTransactionSend(:final data) => data.dest,
        MultisigTransactionSubmit(:final data) => data.dest,
        _ => null,
      };

      if (dest != null) return dest;
    }

    return data.recipient;
  }

  BigInt? get dataValue {
    return switch (data) {
      TransactionAdditionalInfoDePoolOnRoundComplete(:final data) =>
        data.reward,
      TransactionAdditionalInfoWalletInteraction(:final data) =>
        switch (data.method) {
          WalletInteractionMethodMultisig(:final data) => switch (data) {
            MultisigTransactionSend(:final data) => data.value,
            MultisigTransactionSubmit(:final data) => data.value,
            _ => null,
          },
          _ => null,
        },
      _ => null,
    };
  }

  String? get comment => switch (data) {
    TransactionAdditionalInfoComment(:final data) => data,
    _ => null,
  };

  DePoolOnRoundCompleteNotification? get dePoolOnRoundCompleteNotification =>
      switch (data) {
        TransactionAdditionalInfoDePoolOnRoundComplete(:final data) => data,
        _ => null,
      };

  DePoolReceiveAnswerNotification? get dePoolReceiveAnswerNotification =>
      switch (data) {
        TransactionAdditionalInfoDePoolReceiveAnswer(:final data) => data,
        _ => null,
      };

  TokenWalletDeployedNotification? get tokenWalletDeployedNotification =>
      switch (data) {
        TransactionAdditionalInfoTokenWalletDeployed(:final data) => data,
        _ => null,
      };

  WalletInteractionInfo? get walletInteractionInfo => switch (data) {
    TransactionAdditionalInfoWalletInteraction(:final data) => data,
    _ => null,
  };

  bool get isMultisigTransaction {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit() => true,
        MultisigTransactionConfirm() => true,
        _ => false,
      },
      _ => false,
    };
  }

  bool isOrdinaryTransaction({
    required TonWalletDetails details,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required List<MultisigPendingTransaction> pendingTransactions,
  }) {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit(:final data) =>
          pendingTransactions.every((e) => e.id != data.transId) &&
              isEnoughSubscribers(data.transId, details, transactions),
        _ => false,
      },
      _ => false,
    };
  }

  bool isConfirmTransaction(String id) {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionConfirm(:final data) => data.transactionId == id,
        _ => false,
      },
      _ => false,
    };
  }

  bool isSubmitOrConfirmTransaction(String id) {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit(:final data) => data.transId == id,
        MultisigTransactionConfirm(:final data) => data.transactionId == id,
        _ => false,
      },
      _ => false,
    };
  }

  bool isPendingTransaction(
    List<MultisigPendingTransaction> pendingTransactions,
  ) {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit(:final data) => pendingTransactions.any(
          (e) => e.id == data.transId,
        ),
        _ => false,
      },
      _ => false,
    };
  }

  bool isExpiredTransaction({
    required TonWalletDetails details,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  }) {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit(:final data) =>
          !isEnoughSubscribers(data.transId, details, transactions) &&
              isExpiredByTime(details),
        _ => false,
      },
      _ => false,
    };
  }

  /// More or equals to required confirmations were achieved
  bool isEnoughSubscribers(
    String transId,
    TonWalletDetails details,
    List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
  ) {
    if (details.requiredConfirmations == null) return true;

    final foundConfirms = transactions
        .where((e) => e.isConfirmTransaction(transId))
        .length;

    // -1 because 1-st submit transaction is confirmation itself
    return foundConfirms >= details.requiredConfirmations! - 1;
  }

  bool isExpiredByTime(TonWalletDetails details) {
    return transaction.createdAt
        .add(Duration(seconds: details.expirationTime))
        .isBefore(NtpTime.now());
  }

  MultisigSubmitTransaction? get multisigSubmitTransaction {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit(:final data) => data,
        _ => null,
      },
      _ => null,
    };
  }

  PublicKey? get custodian {
    return switch (walletInteractionInfo?.method) {
      WalletInteractionMethodMultisig(:final data) => switch (data) {
        MultisigTransactionSubmit(:final data) => data.custodian,
        MultisigTransactionConfirm(:final data) => data.custodian,
        _ => null,
      },
      _ => null,
    };
  }
}
