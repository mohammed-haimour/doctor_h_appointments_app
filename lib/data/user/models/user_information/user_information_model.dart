import 'package:json_annotation/json_annotation.dart';

part 'user_information_model.g.dart';

@JsonSerializable()
class UserInformationModel {
  final String? _email;
  final String? _password;
  final String? _theme; // "dark" or "light"

  UserInformationModel({
    String? email,
    String? password,
    String? theme,
  })  : _email = email,
        _password = password,
        _theme = theme;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get theme => _theme;

  // copyWith method to update the current instance
  UserInformationModel copyWith({
    String? email,
    String? password,
    String? theme,
  }) {
    return UserInformationModel(
      email: email ?? _email,
      password: password ?? _password,
      theme: theme ?? _theme,
    );
  }

  // Auto-generated from JsonSerializable
  factory UserInformationModel.fromJson(Map<String, dynamic> json) =>
      _$UserInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationModelToJson(this);

  // Function to check if all fields are not null
  bool isNotNull() {
    return _email != null && _password != null && _theme != null;
  }
}
