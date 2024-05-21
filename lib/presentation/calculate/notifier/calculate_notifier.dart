import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/models/calculate_screen_state.dart';
import 'package:currency_exchange/models/calculated_item.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/calculate_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculateNotifier =
    StateNotifierProvider<CalculateScreenNotifier, CalculateScreenState>(
        (ref) => CalculateScreenNotifier(ref));

class CalculateScreenNotifier extends StateNotifier<CalculateScreenState> {
  final Ref _ref;

  CalculateScreenNotifier(this._ref)
      : super(const CalculateScreenState(
            null, false, Transaction.buy, [], [], [], 0, 0, 0));

  bool get isTransactionBuy => state.transaction == Transaction.buy;

  void removeSplitItem(int position) {
    state.selectedPriceRange.removeAt(position);
    state.inputPrice.removeAt(position);
    final currentItem = state.calculatedItem[position];
    removeTotal(currentItem.amount, currentItem.price);
    state.calculatedItem.removeAt(position);
    if (position == state.currentInsert) {
      state = state.copyWith(currentInsert: 0);
    }
    var shouldEnableAdd = true;
    for (var calculatedItem in state.calculatedItem) {
      if (calculatedItem.price == 0.0) {
        shouldEnableAdd = false;
      }
    }
    state = state.copyWith(isAddEnable: shouldEnableAdd);
  }

  //TODO: feeling duplicated
  void addSplitItem() {
    state = state.copyWith(isAddEnable: false, selectedPriceRange: [
      ...state.selectedPriceRange,
      state.transaction == Transaction.buy
          ? state.selectedCurrency!.buyPriceRange.first
          : state.selectedCurrency!.sellPriceRange.first
    ], inputPrice: [
      ...state.inputPrice,
      ''
    ], calculatedItem: [
      ...state.calculatedItem,
      const CalculatedItem(amount: 0.0, price: 0.0)
    ]);
  }

  void updateSelectedPriceRange(int position, PriceRange value) {
    final newRangeList = List<PriceRange>.from(state.selectedPriceRange);
    newRangeList[position] = value;
    state = state.copyWith(selectedPriceRange: newRangeList);
    try {
      calculateAmount(position, state.inputPrice[position]);
    } catch (_) {}
  }

  void updateTransaction() {
    Transaction newState = Transaction.buy;
    if (state.transaction == Transaction.buy) {
      newState = Transaction.sell;
    }
    state = state.copyWith(transaction: newState);

    _clearCurrentBill();
    _setSelectedPriceRange();
    clearTotal();
    addSplitItem();
  }

  void updatePayment(PaymentMethod? value) {
    _ref.read(receiptProvider).setPayment(value);
  }

  void setSelectedCurrency(Country country) {
    state = state.copyWith(selectedCurrency: country);
    _clearCurrentBill();
    _setSelectedPriceRange();
    clearTotal();
    addSplitItem();
  }

  void _setSelectedPriceRange() {
    List.generate(
        state.selectedPriceRange.length,
        (index) => state.selectedPriceRange[index] =
            state.transaction == Transaction.buy
                ? state.selectedCurrency!.buyPriceRange.first
                : state.selectedCurrency!.sellPriceRange.first);
  }

  void _clearCurrentBill() {
    state = state.copyWith(
        selectedPriceRange: [],
        inputPrice: [],
        calculatedItem: [],
        totalItemAmount: 0.0,
        totalItemPrice: 0.0);
  }

  void _onEmptyAmount(int position, String value) {
    final inputList = List<String>.from(state.inputPrice);
    inputList[position] = '';
    final calculatedList = List<CalculatedItem>.from(state.calculatedItem);
    calculatedList[position] = const CalculatedItem(amount: 0.0, price: 0.0);

    state =
        state.copyWith(inputPrice: inputList, calculatedItem: calculatedList);
    throw CalculateException(AppStrings.emptyAlert);
  }

  void calculateAmount(int position, String value) {
    final numValue = value.replaceAll(',', '');
    final splitDecimal = numValue.split('.');

    if (value.isEmpty) {
      _onEmptyAmount(position, value);
    }

    final inputList = List<String>.from(state.inputPrice);
    inputList[position] = CustomNumberFormat.fieldFormat(splitDecimal[0]) +
        (splitDecimal.length > 1 ? '.${splitDecimal[1]}' : '');
    state = state.copyWith(inputPrice: inputList);

    final amount = double.parse(numValue);
    if (amount.isNegative) {
      throw CalculateException(AppStrings.negativeAlert);
    }

    final priceRange = state.selectedPriceRange[position].price ?? 0;
    final price = state.transaction == Transaction.buy
        ? priceRange * amount
        : amount / priceRange;
    final calculatedList = List<CalculatedItem>.from(state.calculatedItem);
    calculatedList[position] = CalculatedItem(
        amount: amount, price: double.parse(price.toStringAsFixed(2)));

    state = state.copyWith(calculatedItem: calculatedList, isAddEnable: true);
    calculateTotal();
  }

  void calculateTotal() {
    bool shouldEnableAdd = true;
    clearTotal();
    for (var calculatedItem in state.calculatedItem) {
      if (calculatedItem.price == 0.0) {
        shouldEnableAdd = false;
      }
      addTotal(calculatedItem.amount, calculatedItem.price);
    }
    state = state.copyWith(isAddEnable: shouldEnableAdd);
    if (state.totalItemAmount == 0.0 || state.totalItemPrice == 0.0) {
      state = state.copyWith(isAddEnable: false);
    }
  }

  void disableAdd() {
    state = state.copyWith(isAddEnable: false);
    clearTotal();
  }

  void addToReceipt() {
    _ref.read(receiptProvider).addCurrencyItem(ExchangeItem(
        priceRange: state.selectedPriceRange,
        calculatedItem: state.calculatedItem,
        amountExchange: state.totalItemAmount,
        totalPrice: state.totalItemPrice,
        currency: state.selectedCurrency!,
        transaction: state.transaction));
    _clearCurrentBill();
    addSplitItem();
  }

  addTotal(double addAmount, double addPrice) {
    state = state.copyWith(
        totalItemPrice: state.totalItemPrice + addPrice,
        totalItemAmount: state.totalItemAmount + addAmount);
  }

  removeTotal(double removeAmount, double removePrice) {
    state = state.copyWith(
        totalItemPrice: state.totalItemPrice - removePrice,
        totalItemAmount: state.totalItemAmount - removeAmount);
  }

  clearTotal() {
    state = state.copyWith(totalItemPrice: 0, totalItemAmount: 0);
  }
}
