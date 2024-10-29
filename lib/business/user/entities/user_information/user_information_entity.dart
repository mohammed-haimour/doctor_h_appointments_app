import 'package:doctor_h_appointments_app/data/user/models/user_information/user_information_model.dart';
import 'package:flutter/material.dart';

class UserInformationEntity {
  final String? email;
  final String? password;
  final ThemeMode? theme;

  UserInformationEntity({
    required this.email,
    required this.password,
    required this.theme,
  });

  factory UserInformationEntity.fromUserInformationModel({
    required UserInformationModel model,
  }) {
    return UserInformationEntity(
      email: model.email,
      password: model.password,
      theme: model.theme == null
          ? null
          : (model.theme == "light")
              ? ThemeMode.light
              : ThemeMode.dark,
    );
  }

  // Method to check if all properties are not null
  bool isNotNull() {
    return email != null && password != null && theme != null;
  }

  // Copy method to create a copy with new values
  UserInformationEntity copyWith({
    String? email,
    String? password,
    ThemeMode? theme,
  }) {
    return UserInformationEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      theme: theme ?? this.theme,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserInformationEntity &&
        other.email == email &&
        other.password == password &&
        other.theme == theme;
  }

  @override
  int get hashCode => Object.hash(email, password, theme);
}
