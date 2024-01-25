// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionItem _$$_TransactionItemFromJson(Map<String, dynamic> json) =>
    _$_TransactionItem(
      calculatedItem: (json['calculatedItem'] as List<dynamic>)
          .map((e) => ExchangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: json['dateTime'] as String,
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
    );

Map<String, dynamic> _$$_TransactionItemToJson(_$_TransactionItem instance) =>
    <String, dynamic>{
      'calculatedItem': instance.calculatedItem.map((e) => e.toJson()).toList(),
      'dateTime': instance.dateTime,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.weChatMom: 'weChatMom',
  PaymentMethod.weChatDad: 'weChatDad',
  PaymentMethod.cancel: 'cancel',
};
