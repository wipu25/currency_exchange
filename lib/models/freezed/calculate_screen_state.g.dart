// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../calculate_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalculateScreenState _$$_CalculateScreenStateFromJson(
        Map<String, dynamic> json) =>
    _$_CalculateScreenState(
      json['selectedCurrency'] == null
          ? null
          : Country.fromJson(json['selectedCurrency'] as Map<String, dynamic>),
      json['isAddEnable'] as bool,
      $enumDecode(_$TransactionEnumMap, json['transaction']),
      (json['selectedPriceRange'] as List<dynamic>)
          .map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['inputPrice'] as List<dynamic>).map((e) => e as String).toList(),
      (json['calculatedItem'] as List<dynamic>)
          .map((e) => CalculatedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['currentInsert'] as int,
      (json['totalItemAmount'] as num).toDouble(),
      (json['totalItemPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CalculateScreenStateToJson(
        _$_CalculateScreenState instance) =>
    <String, dynamic>{
      'selectedCurrency': instance.selectedCurrency?.toJson(),
      'isAddEnable': instance.isAddEnable,
      'transaction': _$TransactionEnumMap[instance.transaction]!,
      'selectedPriceRange':
          instance.selectedPriceRange.map((e) => e.toJson()).toList(),
      'inputPrice': instance.inputPrice,
      'calculatedItem': instance.calculatedItem.map((e) => e.toJson()).toList(),
      'currentInsert': instance.currentInsert,
      'totalItemAmount': instance.totalItemAmount,
      'totalItemPrice': instance.totalItemPrice,
    };

const _$TransactionEnumMap = {
  Transaction.buy: 'buy',
  Transaction.sell: 'sell',
};