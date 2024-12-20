import 'package:thanarak_exchange/helpers/number_format.dart';
import 'package:thanarak_exchange/models/client_info.dart';
import 'package:thanarak_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/transaction_item.freezed.dart';
part 'freezed/transaction_item.g.dart';

@freezed
class TransactionItem with _$TransactionItem {
  const TransactionItem._();

  const factory TransactionItem(
      {required List<ExchangeItem> calculatedItem,
      //due to order transaction is not yet implemented total value
      double? totalBuyPrice,
      double? totalSellPrice,
      required String dateTime,
      required PaymentMethod paymentMethod,
      ClientInfo? clientInfo}) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, Object?> json) =>
      _$TransactionItemFromJson(json);

  String getTotalBuyPrice() {
    return CustomNumberFormat.commaFormat1(totalBuyPrice);
  }

  String getTotalSellPrice() {
    return CustomNumberFormat.commaFormat1(totalSellPrice);
  }
}
