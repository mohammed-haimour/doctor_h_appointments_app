// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountResponseModel _$CreateAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateAccountResponseModel(
      message: json['message'] as String,
      userDataAndToken: CreateAccountResponseDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$CreateAccountResponseModelToJson(
        CreateAccountResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userDataAndToken,
      'status': instance.status,
      'code': instance.code,
    };

CreateAccountResponseDataModel _$CreateAccountResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    CreateAccountResponseDataModel(
      token: json['token'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$CreateAccountResponseDataModelToJson(
        CreateAccountResponseDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
    };
