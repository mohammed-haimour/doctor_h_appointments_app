import 'package:dartz/dartz.dart';
import 'package:doctor_h_appointments_app/business/doctors/entities/get_all_doctors_result_entity.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

abstract class DoctorsBusinessInterface {
  Future<Either<Failure, GetAllDoctorsResultEntity>> getAllDoctors();
}
