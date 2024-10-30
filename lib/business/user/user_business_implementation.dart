import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/business/user/entities/create_account/create_account_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/login_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/entities/user_preferences/user_preferences_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_preferences/user_preferences_model.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/networking/dio_factory.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter/material.dart';

class UserBusinessImplementation implements UserBusinessInterface {
  final UserDataInterface _userDataLayer;

  UserBusinessImplementation({required UserDataInterface userDataInterface})
      : _userDataLayer = userDataInterface;

  UserPreferencesEntity? _userPreferences;

  @override
  UserPreferencesEntity? get userPreferences => _userPreferences;

  @override
  Future<Either<Failure, LoginResultEntity>> logIn(
      {required LoginPayloadModel loginPayload}) async {
    try {
      LoginResponseModel responseModel =
          await _userDataLayer.login(loginPayload: loginPayload);

      // saving user credintials to local db
      if (responseModel.code == 200) {
        saveUserPreferences(
            userPreferencesToSave: _userPreferences!.copyWith(
                email: loginPayload.email,
                password: loginPayload.password,
                userName: responseModel.userDataAndToken.username));
        DioFactory.setTokenIntoHeaderAfterLogin(
            responseModel.userDataAndToken.token);
        await getUserPreferences();
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
        saveUserPreferences(
            userPreferencesToSave: _userPreferences!.copyWith(
                email: createAccountPayload.email,
                password: createAccountPayload.password,
                userName: responseModel.userDataAndToken.username));
        DioFactory.setTokenIntoHeaderAfterLogin(
            responseModel.userDataAndToken.token);
        await getUserPreferences();
      }

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
  Future<Either<Failure, void>> getUserPreferences() async {
    try {
      UserPreferencesModel? model = await _userDataLayer.getUserPreferences();

      print("${model?.email}");
      print("${model?.password}");
      print("${model?.theme}");
      print("${model?.userName}");

      if (model == null) {
        return right(null);
      }

      UserPreferencesEntity entity =
          UserPreferencesEntity.fromUserPreferencesModel(model: model);

      _userPreferences = entity;

      return right(null);
    } on Exception catch (error) {
      return left(LocalDbFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserPreferences(
      {required UserPreferencesEntity userPreferencesToSave}) async {
    if (_userPreferences != userPreferencesToSave) {
      try {
        UserPreferencesModel userPreferencesModel = UserPreferencesModel(
            email: userPreferencesToSave.email,
            password: userPreferencesToSave.password,
            theme: userPreferencesToSave.theme == null
                ? null
                : userPreferencesToSave.theme == ThemeMode.light
                    ? "light"
                    : "dark",
            userName: userPreferencesToSave.userName);

        await _userDataLayer.saveUserPreferences(
            userPreferencesToSave: userPreferencesModel);
        return right(null); // what should i do here OH nothing LOL
      } on Exception catch (error) {
        return left(LocalDbFailure(error.toString()));
      }
    } else {
      return right(null);
    }
  }

  @override
  Future<Either<Failure, LoginResultEntity>>
      logInWithSavedUserCredentials() async {
    try {
      LoginResponseModel responseModel = await _userDataLayer.login(
          loginPayload: LoginPayloadModel(
              email: getIt<UserBusinessInterface>().userPreferences!.email!,
              password:
                  getIt<UserBusinessInterface>().userPreferences!.password!));

      if (responseModel.code == 200) {
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
}
