import 'package:json_annotation/json_annotation.dart';

part 'user_information_model.g.dart';

@JsonSerializable()
class UserInformationModel {
  String? _email;
  String? _password;
  String? _theme; // "dark" or "light"
  String? _isQuickAccess; // "0" for false, "1" for true

  UserInformationModel({
    String? email,
    String? password,
    String? theme,
    String? isQuickAccess,
  })  : _email = email,
        _password = password,
        _theme = theme,
        _isQuickAccess = isQuickAccess;

  // Getters
  String? get email => _email;
  String? get password => _password;
  String? get theme => _theme;
  String? get isQuickAccess => _isQuickAccess;

  // copyWith method to update the current instance
  void copyWith({
    String? email,
    String? password,
    String? theme,
    String? isQuickAccess,
  }) {
    _email = email ?? _email;
    _password = password ?? _password;
    _theme = theme ?? _theme;
    _isQuickAccess = isQuickAccess ?? _isQuickAccess;
  }

  // Auto-generated from JsonSerializable
  factory UserInformationModel.fromJson(Map<String, dynamic> json) =>
      _$UserInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationModelToJson(this);
}
