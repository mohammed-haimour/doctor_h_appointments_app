// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountPayloadModel _$CreateAccountPayloadModelFromJson(
        Map<String, dynamic> json) =>
    CreateAccountPayloadModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$CreateAccountPayloadModelToJson(
        CreateAccountPayloadModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
