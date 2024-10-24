import 'package:json_annotation/json_annotation.dart';

part 'create_account_payload_model.g.dart';

@JsonSerializable()
class CreateAccountPayloadModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;

  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  CreateAccountPayloadModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  // toJson method for serialization
  Map<String, dynamic> toJson() => _$CreateAccountPayloadModelToJson(this);
}
