import 'package:json_annotation/json_annotation.dart';

part 'get_all_doctors_response_model.g.dart';

@JsonSerializable()
class GetAllDoctorsResponseModel {
  final String message;
  final List<Doctor> data;
  final bool status;
  final int code;

  GetAllDoctorsResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory GetAllDoctorsResponseModel.fromJson(Map<String, dynamic> json) => _$GetAllDoctorsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllDoctorsResponseModelToJson(this);
}

@JsonSerializable()
class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final Specialization specialization;
  final City city;
  @JsonKey(name: 'appoint_price')
  final int appointPrice;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Specialization {
  final int id;
  final String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => _$SpecializationFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

@JsonSerializable()
class City {
  final int id;
  final String name;
  final Governrate governrate;

  City({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Governrate {
  final int id;
  final String name;

  Governrate({
    required this.id,
    required this.name,
  });

  factory Governrate.fromJson(Map<String, dynamic> json) => _$GovernrateFromJson(json);
  Map<String, dynamic> toJson() => _$GovernrateToJson(this);
}
