import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/models/transaction_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/receipt_service_state.freezed.dart';
part 'freezed/receipt_service_state.g.dart';

@freezed
class ReceiptServiceState with _$ReceiptServiceState {
  const ReceiptServiceState._();

  const factory ReceiptServiceState(
      TransactionItem? currentTransaction,
      double totalItemAmount,
      double totalItemPrice,
      double totalBuyPrice,
      double totalSellPrice,
      int sellTransactionCount,
      List<ExchangeItem> currencyItem,
      Transaction transaction,
      PaymentMethod payment) = _ReceiptServiceState;

  factory ReceiptServiceState.fromJson(Map<String, Object?> json) =>
      _$ReceiptServiceStateFromJson(json);
}
