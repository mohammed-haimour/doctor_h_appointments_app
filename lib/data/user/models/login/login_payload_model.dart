import 'package:json_annotation/json_annotation.dart';

part 'login_payload_model.g.dart';

@JsonSerializable()
class LoginPayloadModel {
  final String email;
  final String password;

  LoginPayloadModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return _$LoginPayloadModelToJson(this);
  }
}
