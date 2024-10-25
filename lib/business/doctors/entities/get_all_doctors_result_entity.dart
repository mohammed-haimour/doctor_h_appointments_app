import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';

class GetAllDoctorsResultEntity {
  final List<Doctor> doctors;
  GetAllDoctorsResultEntity({required this.doctors});

  factory GetAllDoctorsResultEntity.fromGetAllDoctorsReponseModel(
      {required GetAllDoctorsResponseModel model}) {
    return GetAllDoctorsResultEntity(doctors: model.data);
  }
}
