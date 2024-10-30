import 'package:json_annotation/json_annotation.dart';

part 'get_user_informations_response_model.g.dart';

@JsonSerializable()
class GetUserInformationsResponseModel {
  final String message;
  final List<UserInformationsForGet> informations;
  final bool status;
  final int code;

  GetUserInformationsResponseModel({
    required this.message,
    required this.informations,
    required this.status,
    required this.code,
  });

  // JSON serialization/deserialization methods
  factory GetUserInformationsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserInformationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetUserInformationsResponseModelToJson(this);
}

@JsonSerializable()
class UserInformationsForGet {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  UserInformationsForGet({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory UserInformationsForGet.fromJson(Map<String, dynamic> json) =>
      _$UserInformationsForGetFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationsForGetToJson(this);
}
