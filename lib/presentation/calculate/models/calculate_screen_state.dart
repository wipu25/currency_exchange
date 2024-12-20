import 'package:thanarak_exchange/models/country.dart';
import 'package:thanarak_exchange/models/receipt.dart';
import 'package:thanarak_exchange/presentation/calculate/models/calculated_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/calculate_screen_state.freezed.dart';
part 'freezed/calculate_screen_state.g.dart';

@freezed
class CalculateScreenState with _$CalculateScreenState {
  const CalculateScreenState._();

  const factory CalculateScreenState(
      Country? selectedCurrency,
      bool isAddEnable,
      Transaction transaction,
      List<CalculatedItem> calculatedItem,
      int currentInsert,
      double totalItemAmount,
      double totalItemPrice) = _CalculateScreenState;

  factory CalculateScreenState.fromJson(Map<String, Object?> json) =>
      _$CalculateScreenStateFromJson(json);
}
