import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item.freezed.dart';
part 'transaction_item.g.dart';

@freezed
class TransactionItem with _$TransactionItem {
  const factory TransactionItem(
      {required List<ExchangeItem> calculatedItem,
      //due to order transaction is not yet implemented total value
      double? totalBuyPrice,
      double? totalSellPrice,
      required String dateTime,
      required PaymentMethod paymentMethod}) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, Object?> json) =>
      _$TransactionItemFromJson(json);
}
