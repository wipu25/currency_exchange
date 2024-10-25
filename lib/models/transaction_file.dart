import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thanarak_exchange/models/transaction_item.dart';
part 'freezed/transaction_file.freezed.dart';
part 'freezed/transaction_file.g.dart';

@freezed
class TransactionFile with _$TransactionFile {
  const TransactionFile._();

  const factory TransactionFile(
      {required List<TransactionItem> transaction,
      double? totalBuyPrice,
      double? totalSellPrice}) = _TransactionFile;
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory TransactionFile.fromJson(Map<String, Object?> json) =>
      _$TransactionFileFromJson(json);
}
