import 'package:dartz/dartz.dart';
import 'package:doctor_h_appointments_app/business/user/entities/create_account/create_account_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/login_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/user_informations/get_user_informations_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/user_informations/update_user_informations_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/user_preferences/user_preferences_entity.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

abstract class UserBusinessInterface {
  Future<Either<Failure, LoginResultEntity>> logIn(
      {required LoginPayloadModel loginPayload});
  Future<Either<Failure, LoginResultEntity>> logInWithSavedUserCredentials();
  Future<Either<Failure, CreateAccountResultEntity>> createAccount(
      {required CreateAccountPayloadModel createAccountPayload});
  Future<Either<Failure, void>> saveUserPreferences(
      {required UserPreferencesEntity userPreferencesToSave});
  Future<Either<Failure, void>> getUserPreferences();
  UserPreferencesEntity? get userPreferences;

  Future<Either<Failure, GetUserInformationsResultEntity>>
      getUserInformations();
  Future<Either<Failure, UpdateUserInformationsResultEntity>>
      updateUserInfornations(
          {required UpdateUserInformationsPayloadModel userToUpdate});
}
