import 'package:json_annotation/json_annotation.dart';

part 'log_out_response.g.dart';

@JsonSerializable()
class LogoutResponseModel {
  final String message;
  final bool status;
  final int code;

  LogoutResponseModel({
    required this.message,
    required this.status,
    required this.code,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}
