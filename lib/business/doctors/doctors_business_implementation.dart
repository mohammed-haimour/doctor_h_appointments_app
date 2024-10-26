import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/business/doctors/doctors_business_interface.dart';
import 'package:doctor_h_appointments_app/data/doctors/doctors_data_interface.dart';
import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

class DoctorsBusinessImplementation implements DoctorsBusinessInterface {
  final DoctorsDataInterface _doctorsData;

  DoctorsBusinessImplementation({required DoctorsDataInterface doctorsData})
      : _doctorsData = doctorsData;

  @override
  Future<Either<Failure, GetAllDoctorsResponseModel>> getAllDoctors() async {
    try {
      GetAllDoctorsResponseModel responseModel =
          await _doctorsData.getAllDoctors();

      return right(responseModel);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
