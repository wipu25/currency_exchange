// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../summary_dialog_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryDialogStateImpl _$$SummaryDialogStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SummaryDialogStateImpl(
      json['clientInfo'] == null
          ? null
          : ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>),
      json['isInfoFilled'] as bool,
      $enumDecode(_$BillOperationEnumMap, json['billOperation']),
    );

Map<String, dynamic> _$$SummaryDialogStateImplToJson(
        _$SummaryDialogStateImpl instance) =>
    <String, dynamic>{
      'clientInfo': instance.clientInfo?.toJson(),
      'isInfoFilled': instance.isInfoFilled,
      'billOperation': _$BillOperationEnumMap[instance.billOperation]!,
    };

const _$BillOperationEnumMap = {
  BillOperation.save: 'save',
  BillOperation.print: 'print',
  BillOperation.none: 'none',
};
