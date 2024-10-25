import 'package:thanarak_exchange/models/client_info.dart';
import 'package:thanarak_exchange/presentation/calculate/models/summary_dialog_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/summary_dialog_state.freezed.dart';
part 'freezed/summary_dialog_state.g.dart';

@freezed
class SummaryDialogState with _$SummaryDialogState {
  const SummaryDialogState._();

  const factory SummaryDialogState(ClientInfo? clientInfo, bool isInfoFilled,
      BillOperation billOperation) = _SummaryDialogState;

  factory SummaryDialogState.fromJson(Map<String, Object?> json) =>
      _$SummaryDialogStateFromJson(json);
}
