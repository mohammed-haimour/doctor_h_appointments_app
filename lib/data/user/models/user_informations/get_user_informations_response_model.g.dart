// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_informations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInformationsResponseModel _$GetUserInformationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserInformationsResponseModel(
      message: json['message'] as String,
      informations: (json['informations'] as List<dynamic>)
          .map(
              (e) => UserInformationsForGet.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$GetUserInformationsResponseModelToJson(
        GetUserInformationsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'informations': instance.informations,
      'status': instance.status,
      'code': instance.code,
    };

UserInformationsForGet _$UserInformationsForGetFromJson(
        Map<String, dynamic> json) =>
    UserInformationsForGet(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$UserInformationsForGetToJson(
        UserInformationsForGet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
    };
