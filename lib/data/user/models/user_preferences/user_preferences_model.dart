import 'package:json_annotation/json_annotation.dart';

part 'user_preferences_model.g.dart';

@JsonSerializable()
class UserPreferencesModel {
  final String? _email;
  final String? _password;
  final String? _userName; // New field
  final String? _theme; // "dark" or "light"

  UserPreferencesModel({
    String? email,
    String? password,
    String? userName, // Added parameter
    String? theme,
  })  : _email = email,
        _password = password,
        _userName = userName, // Initialize userName
        _theme = theme;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get userName => _userName; // Added getter
  String? get theme => _theme;

  // copyWith method to update the current instance
  UserPreferencesModel copyWith({
    String? email,
    String? password,
    String? userName, // Added parameter
    String? theme,
  }) {
    return UserPreferencesModel(
      email: email ?? _email,
      password: password ?? _password,
      userName: userName ?? _userName, // Updated copyWith
      theme: theme ?? _theme,
    );
  }

  // Auto-generated from JsonSerializable
  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesModelToJson(this);

  // Function to check if all fields are not null
  bool isNotNull() {
    return _email != null &&
        _password != null &&
        _userName != null &&
        _theme != null; // Updated check
  }
}
