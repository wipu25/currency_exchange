// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionItemImpl _$$TransactionItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionItemImpl(
      calculatedItem: (json['calculatedItem'] as List<dynamic>)
          .map((e) => ExchangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBuyPrice: (json['totalBuyPrice'] as num?)?.toDouble(),
      totalSellPrice: (json['totalSellPrice'] as num?)?.toDouble(),
      dateTime: json['dateTime'] as String,
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      clientInfo: json['clientInfo'] == null
          ? null
          : ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionItemImplToJson(
        _$TransactionItemImpl instance) =>
    <String, dynamic>{
      'calculatedItem': instance.calculatedItem.map((e) => e.toJson()).toList(),
      'totalBuyPrice': instance.totalBuyPrice,
      'totalSellPrice': instance.totalSellPrice,
      'dateTime': instance.dateTime,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'clientInfo': instance.clientInfo?.toJson(),
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.weChatMom: 'weChatMom',
  PaymentMethod.weChatDad: 'weChatDad',
  PaymentMethod.binanceTee: 'binanceTee',
  PaymentMethod.aliPay: 'aliPay',
  PaymentMethod.cancel: 'cancel',
};
