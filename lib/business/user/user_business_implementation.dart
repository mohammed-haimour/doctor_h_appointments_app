import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/business/user/entities/create_account/create_account_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/login_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/user_information/user_information_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_information/user_information_model.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_interface.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

class UserBusinessImplementation implements UserBusinessInterface {
  final UserDataInterface _userData;

  UserBusinessImplementation({required UserDataInterface userDataInterface})
      : _userData = userDataInterface;

  @override
  Future<Either<Failure, LoginResultEntity>> logIn(
      {required LoginPayloadModel loginPayload}) async {
    try {
      LoginResponseModel responseModel =
          await _userData.login(loginPayload: loginPayload);

      LoginResultEntity loginResponseEntity =
          LoginResultEntity.fromLoginResponseModel(model: responseModel);

      return right(loginResponseEntity);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateAccountResultEntity>> createAccount(
      {required CreateAccountPayloadModel createAccountPayload}) async {
    try {
      CreateAccountResponseModel responseModel = await _userData.createAccount(
          createAccountPayload: createAccountPayload);

      CreateAccountResultEntity createAccountResultEntity =
          CreateAccountResultEntity.fromCreateAccountResponseModel(
              model: responseModel);

      return right(createAccountResultEntity);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInformationEntity?>> getUserInformation() async {
    try {
      UserInformationModel? model = await _userData.getUserInformation();

      if (model == null) return right(null);

      UserInformationEntity entity =
          UserInformationEntity.fromUserInformationModel(model: model);

      return right(entity);
    } on Exception catch (error) {
      return left(LocalDbFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserInformation(
      {required UserInformationModel userToSave}) async {
    try {
      await _userData.saveUserInformation(userInformation: userToSave);
      return right(null); // what should i do here OH nothing LOL
    } on Exception catch (error) {
      return left(LocalDbFailure(error.toString()));
    }
  }

  @override
  Future<bool> isUserInformationStoredInTheLocalDb() async {
    try {
      UserInformationModel? userInformation =
          await _userData.getUserInformation();

      if (userInformation == null) {
        print("there are null");
        return false;
      } else {
        print("there are not null");

        return true;
      }
    } on Exception {
        print("there are null but error");
      return false;
    }
  }
}
