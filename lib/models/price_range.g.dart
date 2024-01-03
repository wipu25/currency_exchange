// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceRange _$$_PriceRangeFromJson(Map<String, dynamic> json) =>
    _$_PriceRange(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PriceRangeToJson(_$_PriceRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'price': instance.price,
    };
