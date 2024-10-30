import 'package:doctor_h_appointments_app/data/user/models/user_preferences/user_preferences_model.dart';
import 'package:flutter/material.dart';

class UserPreferencesEntity {
  final String? email;
  final String? password;
  final String? userName; // New field
  final ThemeMode? theme;

  UserPreferencesEntity({
    required this.email,
    required this.password,
    required this.userName, // Updated constructor
    required this.theme,
  });

  factory UserPreferencesEntity.fromUserPreferencesModel({
    required UserPreferencesModel model,
  }) {
    return UserPreferencesEntity(
      email: model.email,
      password: model.password,
      userName: model.userName, // Fetching userName from model
      theme: model.theme == null
          ? null
          : (model.theme == "light")
              ? ThemeMode.light
              : ThemeMode.dark,
    );
  }

  // Method to check if all properties are not null
  bool isNotNull() {
    return email != null &&
        password != null &&
        userName != null &&
        theme != null; // Updated check
  }

  // Copy method to create a copy with new values
  UserPreferencesEntity copyWith({
    String? email,
    String? password,
    String? userName, // Added to copyWith
    ThemeMode? theme,
  }) {
    return UserPreferencesEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName, // Updated copyWith
      theme: theme ?? this.theme,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserPreferencesEntity &&
        other.email == email &&
        other.password == password &&
        other.userName == userName && // Added comparison for userName
        other.theme == theme;
  }

  @override
  int get hashCode =>
      Object.hash(email, password, userName, theme); // Updated hashCode
}
