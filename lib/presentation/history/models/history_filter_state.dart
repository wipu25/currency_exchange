import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/history_filter_state.freezed.dart';
part 'freezed/history_filter_state.g.dart';

@freezed
class HistoryFilterState with _$HistoryFilterState {
  const HistoryFilterState._();

  const factory HistoryFilterState(
      List<bool> selectCurrencyFilter,
      List<bool> selectPaymentFilter,
      List<bool> selectTransactionFilter) = _HistoryFilterState;

  factory HistoryFilterState.fromJson(Map<String, Object?> json) =>
      _$HistoryFilterStateFromJson(json);
}
