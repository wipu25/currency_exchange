import 'package:currency_exchange/models/transaction_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/history_screen_state.freezed.dart';
part 'freezed/history_screen_state.g.dart';

@freezed
class HistoryScreenState with _$HistoryScreenState {
  const HistoryScreenState._();

  const factory HistoryScreenState(
      List<TransactionItem> savedHistoryList,
      List<TransactionItem> historyList,
      bool isFilterUpdate,
      bool isLoading,
      bool isCancel,
      bool isClientInfoComplete,
      DateTime? dateTimeDisplay,
      Map<String, bool> currencyFilter,
      Map<String, bool> paymentFilter,
      Map<String, bool> transactionFilter) = _HistoryScreenState;

  factory HistoryScreenState.fromJson(Map<String, Object?> json) =>
      _$HistoryScreenStateFromJson(json);
}
