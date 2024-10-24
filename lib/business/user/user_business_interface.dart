import 'package:dartz/dartz.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/create_account_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/login_result_entity.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

abstract class UserBusinessInterface{
  Future<Either<Failure , LoginResultEntity>> logIn({required LoginPayloadModel loginPayload});
  Future<Either<Failure , CreateAccountResultEntity>> createAccount({required CreateAccountPayloadModel createAccountPayload});
}