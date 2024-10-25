// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../transaction_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionFileImpl _$$TransactionFileImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionFileImpl(
      transaction: (json['transaction'] as List<dynamic>)
          .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBuyPrice: (json['totalBuyPrice'] as num?)?.toDouble(),
      totalSellPrice: (json['totalSellPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TransactionFileImplToJson(
        _$TransactionFileImpl instance) =>
    <String, dynamic>{
      'transaction': instance.transaction.map((e) => e.toJson()).toList(),
      'totalBuyPrice': instance.totalBuyPrice,
      'totalSellPrice': instance.totalSellPrice,
    };
