// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      errors: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'data': instance.errors,
    };
