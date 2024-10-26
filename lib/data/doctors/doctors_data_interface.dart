import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';

abstract class DoctorsDataInterface {
  // no payload needed :)
  Future<GetAllDoctorsResponseModel> getAllDoctors();
}
