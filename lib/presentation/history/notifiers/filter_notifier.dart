import 'package:currency_exchange/helpers/state_helper.dart';
import 'package:currency_exchange/presentation/history/models/history_filter_state.dart';
import 'package:currency_exchange/presentation/history/notifiers/history_notifier.dart';
import 'package:currency_exchange/presentation/history/services/filter_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterNotifier =
    NotifierProvider.autoDispose<FilterNotifier, HistoryFilterState>(
        FilterNotifier.new);

class FilterNotifier extends AutoDisposeNotifier<HistoryFilterState> {
  @override
  HistoryFilterState build() {
    return ref.read(filterService).historyFilterState;
  }

  updateFilter(bool? value, int index, FilterType filterType) {
    switch (filterType) {
      case FilterType.payment:
        state = state.copyWith(
            selectPaymentFilter: StateHelper.updateAt(
                state.selectPaymentFilter, index, value ?? false));
      case FilterType.transaction:
        state = state.copyWith(
            selectTransactionFilter: StateHelper.updateAt(
                state.selectTransactionFilter, index, value ?? false));
      default:
        state = state.copyWith(
            selectCurrencyFilter: StateHelper.updateAt(
                state.selectCurrencyFilter, index, value ?? false));
    }
    if (!ref.read(filterService).isFilterUpdate) {
      ref.read(filterService).isFilterUpdate = true;
    }
  }

  selectAllCurrencyFilter(bool value) {
    final newFilter =
        List.generate(state.selectCurrencyFilter.length, (index) => value);
    state = state.copyWith(selectCurrencyFilter: newFilter);
  }

  saveFilter() => ref.read(filterService).updateFilter(state);
}
