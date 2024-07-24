import 'package:currency_exchange/constants/app_strings.dart';
import 'package:currency_exchange/helpers/number_format.dart';
import 'package:currency_exchange/helpers/state_helper.dart';
import 'package:currency_exchange/presentation/calculate/models/calculate_screen_state.dart';
import 'package:currency_exchange/models/country.dart';
import 'package:currency_exchange/models/exception.dart';
import 'package:currency_exchange/presentation/calculate/models/calculated_item.dart';
import 'package:currency_exchange/presentation/exchange/models/exchange_item.dart';
import 'package:currency_exchange/models/price_range.dart';
import 'package:currency_exchange/models/receipt.dart';
import 'package:currency_exchange/presentation/calculate/services/receipt_service_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculateNotifier =
    NotifierProvider<CalculateScreenNotifier, CalculateScreenState>(
        CalculateScreenNotifier.new);

class CalculateScreenNotifier extends Notifier<CalculateScreenState> {
  @override
  CalculateScreenState build() =>
      const CalculateScreenState(null, false, Transaction.buy, [], 0, 0, 0);

  bool get isTransactionBuy => state.transaction == Transaction.buy;
  List<String> inputPrice = [];

  void removeSplitItem(int position) {
    final currentItem = state.calculatedItem[position];
    removeTotal(currentItem.amount, currentItem.price);
    state = state.copyWith(
        calculatedItem: StateHelper.removeAt(state.calculatedItem, position));
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
    inputPrice.add('');
    state = state.copyWith(isAddEnable: false, calculatedItem: [
      ...state.calculatedItem,
      CalculatedItem(
          priceRange: state.transaction == Transaction.buy
              ? state.selectedCurrency!.buyPriceRange.first
              : state.selectedCurrency!.sellPriceRange.first,
          amount: 0.0,
          price: 0.0)
    ]);
  }

  void updateSelectedPriceRange(int position, PriceRange value) {
    final newRangeList = List<CalculatedItem>.from(state.calculatedItem);
    newRangeList[position] = CalculatedItem(
        priceRange: value,
        amount: state.calculatedItem[position].amount,
        price: state.calculatedItem[position].price);
    state = state.copyWith(calculatedItem: newRangeList);
    try {
      calculateAmount(position, inputPrice[position]);
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
    ref.read(receiptProvider).setPayment(value);
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
        state.calculatedItem.length,
        (index) => state.calculatedItem[index].copyWith(
            priceRange: state.transaction == Transaction.buy
                ? state.selectedCurrency!.buyPriceRange.first
                : state.selectedCurrency!.sellPriceRange.first));
  }

  void _clearCurrentBill() {
    inputPrice = [''];
    state = state.copyWith(
        calculatedItem: [], totalItemAmount: 0.0, totalItemPrice: 0.0);
  }

  void _onEmptyAmount(int position, String value) {
    final inputList = List<String>.from(inputPrice);
    inputList[position] = '';
    final calculatedList = List<CalculatedItem>.from(state.calculatedItem);
    calculatedList[position] =
        state.calculatedItem[position].copyWith(amount: 0.0, price: 0.0);

    inputPrice = inputList;
    state = state.copyWith(calculatedItem: calculatedList);
    throw CalculateException(AppStrings.emptyAlert);
  }

  void calculateAmount(int position, String value) {
    final numValue = value.replaceAll(',', '');
    final splitDecimal = numValue.split('.');

    if (value.isEmpty) {
      _onEmptyAmount(position, value);
    }

    final inputList = List<String>.from(inputPrice);
    inputList[position] = CustomNumberFormat.fieldFormat(splitDecimal[0]) +
        (splitDecimal.length > 1 ? '.${splitDecimal[1]}' : '');
    inputPrice = inputList;

    final amount = double.parse(numValue);
    if (amount.isNegative) {
      throw CalculateException(AppStrings.negativeAlert);
    }

    final priceRange = state.calculatedItem[position].priceRange;
    final price = state.transaction == Transaction.buy
        ? priceRange?.price ?? 0 * amount
        : amount / (priceRange?.price ?? 0);
    final calculatedList = List<CalculatedItem>.from(state.calculatedItem);
    calculatedList[position] = CalculatedItem(
        priceRange: priceRange,
        amount: amount,
        price: double.parse(price.toString()));

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
    ref.read(receiptProvider).addCurrencyItem(ExchangeItem(
        calculatedItem: state.calculatedItem,
        amountExchange: state.totalItemAmount,
        totalPrice: state.totalItemPrice,
        currency: state.selectedCurrency!.currency,
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
