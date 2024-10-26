import 'package:dartz/dartz.dart';
import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

abstract class DoctorsBusinessInterface {
  Future<Either<Failure, GetAllDoctorsResponseModel>> getAllDoctors();
}
