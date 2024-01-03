// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExchangeItem _$$_ExchangeItemFromJson(Map<String, dynamic> json) =>
    _$_ExchangeItem(
      priceRange: (json['priceRange'] as List<dynamic>)
          .map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      calculatedItem: (json['calculatedItem'] as List<dynamic>)
          .map((e) => CalculatedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      amountExchange: (json['amountExchange'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      currency: json['currency'] as String,
      transaction: json['transaction'] as String,
    );

Map<String, dynamic> _$$_ExchangeItemToJson(_$_ExchangeItem instance) =>
    <String, dynamic>{
      'priceRange': instance.priceRange.map((e) => e.toJson()).toList(),
      'calculatedItem': instance.calculatedItem.map((e) => e.toJson()).toList(),
      'amountExchange': instance.amountExchange,
      'totalPrice': instance.totalPrice,
      'currency': instance.currency,
      'transaction': instance.transaction,
    };
