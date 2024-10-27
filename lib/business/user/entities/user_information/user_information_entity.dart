import 'package:doctor_h_appointments_app/data/user/models/user_information/user_information_model.dart';
import 'package:flutter/material.dart';

class UserInformationEntity {
  final String? email;
  final String? password;
  final ThemeMode? theme;
  final bool? isQuickAccess;

  UserInformationEntity({
    required this.email,
    required this.password,
    required this.theme,
    required this.isQuickAccess,
  });

  factory UserInformationEntity.fromUserInformationModel({
    required UserInformationModel model,
  }) {
    return UserInformationEntity(
      email: model.email,
      password: model.password,
      theme: (model.theme == "light") ? ThemeMode.light : ThemeMode.dark,
      isQuickAccess: (model.isQuickAccess == "true") ? true : false,
    );
  }

  // Method to check if all properties are not null
  bool isNotNull() {
    return email != null &&
        password != null &&
        theme != null &&
        isQuickAccess != null;
  }
}
