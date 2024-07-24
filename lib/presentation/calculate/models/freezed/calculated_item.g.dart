// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../calculated_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculatedItemImpl _$$CalculatedItemImplFromJson(Map<String, dynamic> json) =>
    _$CalculatedItemImpl(
      priceRange: json['priceRange'] == null
          ? null
          : PriceRange.fromJson(json['priceRange'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$CalculatedItemImplToJson(
        _$CalculatedItemImpl instance) =>
    <String, dynamic>{
      'priceRange': instance.priceRange?.toJson(),
      'amount': instance.amount,
      'price': instance.price,
    };
