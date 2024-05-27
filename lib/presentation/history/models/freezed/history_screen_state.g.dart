// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../history_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryScreenState _$$_HistoryScreenStateFromJson(
        Map<String, dynamic> json) =>
    _$_HistoryScreenState(
      (json['savedHistoryList'] as List<dynamic>)
          .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['historyList'] as List<dynamic>)
          .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isFilterUpdate'] as bool,
      json['isLoading'] as bool,
      json['isCancel'] as bool,
      json['isClientInfoComplete'] as bool,
      json['dateTimeDisplay'] == null
          ? null
          : DateTime.parse(json['dateTimeDisplay'] as String),
      Map<String, bool>.from(json['currencyFilter'] as Map),
      Map<String, bool>.from(json['paymentFilter'] as Map),
      Map<String, bool>.from(json['transactionFilter'] as Map),
    );

Map<String, dynamic> _$$_HistoryScreenStateToJson(
        _$_HistoryScreenState instance) =>
    <String, dynamic>{
      'savedHistoryList':
          instance.savedHistoryList.map((e) => e.toJson()).toList(),
      'historyList': instance.historyList.map((e) => e.toJson()).toList(),
      'isFilterUpdate': instance.isFilterUpdate,
      'isLoading': instance.isLoading,
      'isCancel': instance.isCancel,
      'isClientInfoComplete': instance.isClientInfoComplete,
      'dateTimeDisplay': instance.dateTimeDisplay?.toIso8601String(),
      'currencyFilter': instance.currencyFilter,
      'paymentFilter': instance.paymentFilter,
      'transactionFilter': instance.transactionFilter,
    };
