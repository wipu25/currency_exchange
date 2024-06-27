import 'package:currency_exchange/presentation/history/models/history_filter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterService = Provider((ref) => FilterService());

class FilterService {
  HistoryFilterState _historyFilterState = const HistoryFilterState([], [], []);
  bool isFilterUpdate = false;

  HistoryFilterState get historyFilterState => _historyFilterState;

  initFilter(int currencyLength, int paymentLength, int transactionLength) {
    _historyFilterState = HistoryFilterState(
      List.generate(currencyLength, (index) => true),
      List.generate(paymentLength, (index) => true),
      List.generate(transactionLength, (index) => true),
    );
  }

  updateFilter(HistoryFilterState historyFilterState) {
    _historyFilterState = historyFilterState;
  }
}
