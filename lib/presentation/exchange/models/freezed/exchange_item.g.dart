// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../exchange_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeItemImpl _$$ExchangeItemImplFromJson(Map<String, dynamic> json) =>
    _$ExchangeItemImpl(
      calculatedItem: (json['calculatedItem'] as List<dynamic>)
          .map((e) => CalculatedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      amountExchange: (json['amountExchange'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      currency: json['currency'] as String,
      transaction: $enumDecode(_$TransactionEnumMap, json['transaction']),
    );

Map<String, dynamic> _$$ExchangeItemImplToJson(_$ExchangeItemImpl instance) =>
    <String, dynamic>{
      'calculatedItem': instance.calculatedItem.map((e) => e.toJson()).toList(),
      'amountExchange': instance.amountExchange,
      'totalPrice': instance.totalPrice,
      'currency': instance.currency,
      'transaction': _$TransactionEnumMap[instance.transaction]!,
    };

const _$TransactionEnumMap = {
  Transaction.buy: 'buy',
  Transaction.sell: 'sell',
};
