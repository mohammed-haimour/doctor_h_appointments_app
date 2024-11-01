// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_informations_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInformationsPayloadModel _$UpdateUserInformationsPayloadModelFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInformationsPayloadModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: (json['gender'] as num).toInt(),
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );

Map<String, dynamic> _$UpdateUserInformationsPayloadModelToJson(
        UpdateUserInformationsPayloadModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
