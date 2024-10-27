// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformationModel _$UserInformationModelFromJson(
        Map<String, dynamic> json) =>
    UserInformationModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      theme: json['theme'] as String?,
      isQuickAccess: json['isQuickAccess'] as String?,
    );

Map<String, dynamic> _$UserInformationModelToJson(
        UserInformationModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'theme': instance.theme,
      'isQuickAccess': instance.isQuickAccess,
    };
