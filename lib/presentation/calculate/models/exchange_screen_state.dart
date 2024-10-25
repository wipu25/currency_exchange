import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/exchange_screen_state.freezed.dart';
part 'freezed/exchange_screen_state.g.dart';

@freezed
class ExchangeScreenState with _$ExchangeScreenState {
  const ExchangeScreenState._();

  const factory ExchangeScreenState({
    required bool isSave,
    required bool isEdit,
    required bool isCurrencyLoading,
  }) = _ExchangeScreenState;

  factory ExchangeScreenState.fromJson(Map<String, Object?> json) =>
      _$ExchangeScreenStateFromJson(json);
}

enum ExchangeState { edit, save, disable }
