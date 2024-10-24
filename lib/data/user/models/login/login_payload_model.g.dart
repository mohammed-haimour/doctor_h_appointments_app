// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPayloadModel _$LoginPayloadModelFromJson(Map<String, dynamic> json) =>
    LoginPayloadModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginPayloadModelToJson(LoginPayloadModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
