// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesModel _$UserPreferencesModelFromJson(
        Map<String, dynamic> json) =>
    UserPreferencesModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$UserPreferencesModelToJson(
        UserPreferencesModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'theme': instance.theme,
    };
