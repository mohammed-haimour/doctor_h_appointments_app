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
import 'package:doctor_h_appointments_app/shared/networking/dio_factory.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter/material.dart';

class UserBusinessImplementation implements UserBusinessInterface {
  final UserDataInterface _userDataLayer;

  UserBusinessImplementation({required UserDataInterface userDataInterface})
      : _userDataLayer = userDataInterface;

  UserInformationEntity? _userInformation;

  @override
  UserInformationEntity? get userInformation => _userInformation;

  @override
  Future<Either<Failure, LoginResultEntity>> logIn(
      {required LoginPayloadModel loginPayload}) async {
    try {
      LoginResponseModel responseModel =
          await _userDataLayer.login(loginPayload: loginPayload);

      // saving user credintials to local db
      if (responseModel.code == 200) {
        saveUserInformation(
            userToSave: _userInformation!.copyWith(
                email: loginPayload.email,
                password: loginPayload.password,
                token: responseModel.userDataAndToken.token));
        DioFactory.setTokenIntoHeaderAfterLogin(
            responseModel.userDataAndToken.token);
      }

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
      CreateAccountResponseModel responseModel = await _userDataLayer
          .createAccount(createAccountPayload: createAccountPayload);

      // saving user credintials to local db
      if (responseModel.code == 200) {
        saveUserInformation(
            userToSave: _userInformation!.copyWith(
                email: createAccountPayload.email,
                password: createAccountPayload.password,
                token: responseModel.userDataAndToken.token));
        DioFactory.setTokenIntoHeaderAfterLogin(
            responseModel.userDataAndToken.token);
      }

      CreateAccountResultEntity createAccountResultEntity =
          CreateAccountResultEntity.fromCreateAccountResponseModel(
              model: responseModel);

      // save user data

      return right(createAccountResultEntity);
    } on Exception catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getUserInformation() async {
    try {
      UserInformationModel? model = await _userDataLayer.getUserInformation();

      if (model == null) {
        return right(null);
      }

      UserInformationEntity entity =
          UserInformationEntity.fromUserInformationModel(model: model);

      _userInformation = entity;

      return right(null);
    } on Exception catch (error) {
      return left(LocalDbFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserInformation(
      {required UserInformationEntity userToSave}) async {
    if (_userInformation != userToSave) {
      try {
        UserInformationModel userInformationModel = UserInformationModel(
          email: userToSave.email,
          password: userToSave.password,
          theme: userToSave.theme == null
              ? null
              : userToSave.theme == ThemeMode.light
                  ? "light"
                  : "dark",
        );

        await _userDataLayer.saveUserInformation(
            userInformation: userInformationModel);
        return right(null); // what should i do here OH nothing LOL
      } on Exception catch (error) {
        return left(LocalDbFailure(error.toString()));
      }
    } else {
      return right(null);
    }
  }
}
