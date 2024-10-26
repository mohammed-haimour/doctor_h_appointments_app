import 'package:json_annotation/json_annotation.dart';

part 'user_information_model.g.dart';

@JsonSerializable()
class UserInformationModel {
  final String email;
  final String password;
  final String theme; // "dark" or "light"
  final String isQuickAccess; // "0" for false, "1" for true

  UserInformationModel({
    required this.email,
    required this.password,
    required this.theme,
    required this.isQuickAccess,
  });

  // Auto-generated from JsonSerializable
  factory UserInformationModel.fromJson(Map<String, dynamic> json) =>
      _$UserInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationModelToJson(this);
}
