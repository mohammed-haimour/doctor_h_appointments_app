import 'package:json_annotation/json_annotation.dart';

part 'user_information_model.g.dart';

@JsonSerializable()
class UserInformationModel {
  final String? _email;
  final String? _password;
  final String? _theme; // "dark" or "light"
  final String? _token;

  UserInformationModel({
    String? email,
    String? password,
    String? theme,
    String? token,
  })  : _email = email,
        _password = password,
        _theme = theme,
        _token = token;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get theme => _theme;
  String? get token => _token;

  // copyWith method to update the current instance
  UserInformationModel copyWith({
    String? email,
    String? password,
    String? theme,
    String? token,
  }) {
    return UserInformationModel(
      email: email ?? _email,
      password: password ?? _password,
      theme: theme ?? _theme,
      token: token ?? _token,
    );
  }

  // Auto-generated from JsonSerializable
  factory UserInformationModel.fromJson(Map<String, dynamic> json) =>
      _$UserInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationModelToJson(this);

  // Function to check if all fields are not null
  bool isNotNull() {
    return _email != null && _password != null && _theme != null && _token != null;
  }
}
