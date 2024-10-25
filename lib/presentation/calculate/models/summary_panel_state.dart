import 'package:thanarak_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/models/transaction_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/summary_panel_state.freezed.dart';
part 'freezed/summary_panel_state.g.dart';

@freezed
class SummaryPanelState with _$SummaryPanelState {
  const SummaryPanelState._();

  const factory SummaryPanelState(
      TransactionItem? currentTransaction,
      double totalBuyPrice,
      double totalSellPrice,
      List<ExchangeItem> currencyItem,
      PaymentMethod payment) = _SummaryPanelState;

  factory SummaryPanelState.fromJson(Map<String, Object?> json) =>
      _$SummaryPanelStateFromJson(json);
}
