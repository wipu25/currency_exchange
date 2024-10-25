// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../receipt_service_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptServiceStateImpl _$$ReceiptServiceStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptServiceStateImpl(
      json['currentTransaction'] == null
          ? null
          : TransactionItem.fromJson(
              json['currentTransaction'] as Map<String, dynamic>),
      (json['totalItemAmount'] as num).toDouble(),
      (json['totalItemPrice'] as num).toDouble(),
      (json['totalBuyPrice'] as num).toDouble(),
      (json['totalSellPrice'] as num).toDouble(),
      (json['sellTransactionCount'] as num).toInt(),
      (json['currencyItem'] as List<dynamic>)
          .map((e) => ExchangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecode(_$TransactionEnumMap, json['transaction']),
      $enumDecode(_$PaymentMethodEnumMap, json['payment']),
    );

Map<String, dynamic> _$$ReceiptServiceStateImplToJson(
        _$ReceiptServiceStateImpl instance) =>
    <String, dynamic>{
      'currentTransaction': instance.currentTransaction?.toJson(),
      'totalItemAmount': instance.totalItemAmount,
      'totalItemPrice': instance.totalItemPrice,
      'totalBuyPrice': instance.totalBuyPrice,
      'totalSellPrice': instance.totalSellPrice,
      'sellTransactionCount': instance.sellTransactionCount,
      'currencyItem': instance.currencyItem.map((e) => e.toJson()).toList(),
      'transaction': _$TransactionEnumMap[instance.transaction]!,
      'payment': _$PaymentMethodEnumMap[instance.payment]!,
    };

const _$TransactionEnumMap = {
  Transaction.buy: 'buy',
  Transaction.sell: 'sell',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.weChatMom: 'weChatMom',
  PaymentMethod.weChatDad: 'weChatDad',
  PaymentMethod.binanceTee: 'binanceTee',
  PaymentMethod.aliPay: 'aliPay',
  PaymentMethod.cancel: 'cancel',
};
