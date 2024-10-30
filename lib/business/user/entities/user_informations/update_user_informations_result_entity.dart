import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_response_model.dart';

class UpdateUserInformationsResultEntity {
  final String id;
  final String message;

  factory UpdateUserInformationsResultEntity.fromUpdateUserInformationsResponseModelToEntity(
      {required UpdateUserInformationsResponseModel userToConvert}) {
    return UpdateUserInformationsResultEntity(
        id: userToConvert.informations.id.toString(),
        message: userToConvert.message);
  }

  UpdateUserInformationsResultEntity({required this.id, required this.message});
}
