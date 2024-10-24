import 'package:json_annotation/json_annotation.dart';

part 'create_account_response_model.g.dart';

@JsonSerializable()
class CreateAccountResponseModel {
  final String message;
  final CreateAccountResponseDataModel userDataAndToken; // Nested class for "data"
  final bool status;
  final int code;

  CreateAccountResponseModel({
    required this.message,
    required this.userDataAndToken,
    required this.status,
    required this.code,
  });

  // Factory constructor for creating a new instance from a map (for deserialization)
  factory CreateAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseModelFromJson(json);
}

// Define the Data class to match the structure of the "data" field
@JsonSerializable()
class CreateAccountResponseDataModel {
  final String token;
  final String username;

  CreateAccountResponseDataModel({
    required this.token,
    required this.username,
  });

  // Factory constructor for creating a new instance from a map
  factory CreateAccountResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseDataModelFromJson(json);
}
