import 'package:json_annotation/json_annotation.dart';

part 'login_reponse_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  @JsonKey(name: "data")
  final LoginData userDataAndToken;
  final bool status;
  final int code;

  LoginResponseModel({
    required this.message,
    required this.userDataAndToken,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class LoginData {
  final String token;
  final String username;

  LoginData({
    required this.token,
    required this.username,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
