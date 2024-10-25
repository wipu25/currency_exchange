import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/client_info.freezed.dart';
part 'freezed/client_info.g.dart';

@freezed
class ClientInfo with _$ClientInfo {
  const ClientInfo._();

  const factory ClientInfo({String? name, String? id, String? address}) =
      _ClientInfo;

  factory ClientInfo.fromJson(Map<String, Object?> json) =>
      _$ClientInfoFromJson(json);

  bool isEmpty() {
    return name?.isEmpty ??
        true && (id?.isEmpty ?? true) && (address?.isEmpty ?? true);
  }
}
