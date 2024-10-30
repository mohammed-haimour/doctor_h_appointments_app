import 'package:json_annotation/json_annotation.dart';

part 'update_user_informations_payload_model.g.dart';

@JsonSerializable()
class UpdateUserInformationsPayloadModel {
  final String name;
  final String email;
  final String phone;
  final int gender;
  final String password;
  final String passwordConfirmation;

  UpdateUserInformationsPayloadModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  factory UpdateUserInformationsPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInformationsPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserInformationsPayloadModelToJson(this);
}
