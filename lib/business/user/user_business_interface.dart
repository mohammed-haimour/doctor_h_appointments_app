import 'package:dartz/dartz.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/login_response_entity.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

abstract class UserBusinessInterface{
  Future<Either<Failure , LoginResponseEntity>> login({required LoginPayloadModel loginPayload});
}