// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      logo: json['logo'] as String,
      currency: json['currency'] as String,
      countryName: json['countryName'] as String,
      buyPriceRange: (json['buyPriceRange'] as List<dynamic>)
          .map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellPriceRange: (json['sellPriceRange'] as List<dynamic>)
          .map((e) => PriceRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'currency': instance.currency,
      'countryName': instance.countryName,
      'buyPriceRange': instance.buyPriceRange.map((e) => e.toJson()).toList(),
      'sellPriceRange': instance.sellPriceRange.map((e) => e.toJson()).toList(),
    };
