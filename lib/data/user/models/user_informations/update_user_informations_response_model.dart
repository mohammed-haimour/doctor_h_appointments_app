import 'package:json_annotation/json_annotation.dart';

part 'update_user_informations_response_model.g.dart';

@JsonSerializable()
class UpdateUserInformationsResponseModel {
  final String message;
  @JsonKey(name: "data")
  final UserInformations informations;
  final bool status;
  final int code;

  UpdateUserInformationsResponseModel({
    required this.message,
    required this.informations,
    required this.status,
    required this.code,
  });

  factory UpdateUserInformationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInformationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserInformationsResponseModelToJson(this);
}

@JsonSerializable()
class UserInformations {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserInformations({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserInformations.fromJson(Map<String, dynamic> json) => _$UserInformationsFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationsToJson(this);
}
