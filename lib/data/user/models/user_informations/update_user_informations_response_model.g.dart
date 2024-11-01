// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_informations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInformationsResponseModel
    _$UpdateUserInformationsResponseModelFromJson(Map<String, dynamic> json) =>
        UpdateUserInformationsResponseModel(
          message: json['message'] as String,
          informations:
              UserInformations.fromJson(json['data'] as Map<String, dynamic>),
          status: json['status'] as bool,
          code: (json['code'] as num).toInt(),
        );

Map<String, dynamic> _$UpdateUserInformationsResponseModelToJson(
        UpdateUserInformationsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.informations,
      'status': instance.status,
      'code': instance.code,
    };

UserInformations _$UserInformationsFromJson(Map<String, dynamic> json) =>
    UserInformations(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserInformationsToJson(UserInformations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
