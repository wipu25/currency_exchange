// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../summary_panel_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryPanelStateImpl _$$SummaryPanelStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryPanelStateImpl(
      json['currentTransaction'] == null
          ? null
          : TransactionItem.fromJson(
              json['currentTransaction'] as Map<String, dynamic>),
      (json['totalBuyPrice'] as num).toDouble(),
      (json['totalSellPrice'] as num).toDouble(),
      (json['currencyItem'] as List<dynamic>)
          .map((e) => ExchangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecode(_$PaymentMethodEnumMap, json['payment']),
    );

Map<String, dynamic> _$$SummaryPanelStateImplToJson(
        _$SummaryPanelStateImpl instance) =>
    <String, dynamic>{
      'currentTransaction': instance.currentTransaction?.toJson(),
      'totalBuyPrice': instance.totalBuyPrice,
      'totalSellPrice': instance.totalSellPrice,
      'currencyItem': instance.currencyItem.map((e) => e.toJson()).toList(),
      'payment': _$PaymentMethodEnumMap[instance.payment]!,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.weChatMom: 'weChatMom',
  PaymentMethod.weChatDad: 'weChatDad',
  PaymentMethod.binanceTee: 'binanceTee',
  PaymentMethod.aliPay: 'aliPay',
  PaymentMethod.cancel: 'cancel',
};
