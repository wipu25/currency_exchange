import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/models/summary_panel_state.dart';
import 'package:currency_exchange/presentation/calculate/services/receipt_service_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final summaryPanelNotifier =
    StateNotifierProvider<SummaryPanelNotifier, SummaryPanelState>(
        (ref) => SummaryPanelNotifier(ref));

class SummaryPanelNotifier extends StateNotifier<SummaryPanelState> {
  final Ref _ref;

  SummaryPanelNotifier(this._ref)
      : super(const SummaryPanelState(null, 0.0, 0.0, [], PaymentMethod.cash));

  String get totalBuyPriceComma =>
      CustomNumberFormat.commaFormat(state.totalBuyPrice);
  String get totalSellPriceComma =>
      CustomNumberFormat.commaFormat(state.totalSellPrice);

  void getSummary() {
    final receiptService = _ref.read(receiptProvider);
    state = state.copyWith(
        currencyItem: receiptService.currencyItem,
        totalSellPrice: receiptService.totalSellPrice,
        totalBuyPrice: receiptService.totalBuyPrice);
  }

  void setPayment(PaymentMethod? value) {
    if (value == null) return;
    state = state.copyWith(payment: value);
    _ref.read(receiptProvider).setPayment(value);
  }

  void removeItem(int index) {
    _ref.read(receiptProvider).removeItem(index);
    getSummary();
  }

  void submit() {
    _ref.read(receiptProvider).setCurrentTransaction();
  }
}
