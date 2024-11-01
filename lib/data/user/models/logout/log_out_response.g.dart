// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseModel _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponseModel(
      message: json['message'] as String,
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
