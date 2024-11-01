import 'package:doctor_h_appointments_app/data/user/models/user_informations/get_user_informations_response_model.dart';

class GetUserInformationsResultEntity {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String gendor;

  factory GetUserInformationsResultEntity.fromGetUserInformationsResponseModelToEntity(
      {required GetUserInformationsResponseModel userToConvert}) {
    return GetUserInformationsResultEntity(
        id: userToConvert.informations.first.id.toString(),
        name: userToConvert.informations.first.name,
        email: userToConvert.informations.first.email,
        phoneNumber: userToConvert.informations.first.phone,
        gendor: userToConvert.informations.first.gender);
  }

  GetUserInformationsResultEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.gendor});
}
