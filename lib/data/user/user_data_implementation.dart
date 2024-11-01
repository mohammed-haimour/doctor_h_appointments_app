import 'dart:convert';

import 'package:doctor_h_appointments_app/data/user/data_sources/user_data_local_source.dart';
import 'package:doctor_h_appointments_app/data/user/data_sources/user_data_remote_source.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/logout/log_out_response.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/get_user_informations_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_preferences/user_preferences_model.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_interface.dart';

class UserDataImplementation implements UserDataInterface {
  final UserDataRemoteSource _remoteSource;
  // ignore: unused_field
  final UserDataLocalSource _localSource;

  UserDataImplementation(
      {required UserDataRemoteSource remoteSource,
      required UserDataLocalSource localSource})
      : _remoteSource = remoteSource,
        _localSource = localSource;

  @override
  Future<CreateAccountResponseModel> createAccount(
      {required CreateAccountPayloadModel createAccountPayload}) async {
    Map<String, dynamic> payload = createAccountPayload.toJson();

    Map<String, dynamic> response =
        await _remoteSource.createAccount(payload: payload);

    CreateAccountResponseModel createAccountResponse =
        CreateAccountResponseModel.fromJson(response);

    return createAccountResponse;
  }

  @override
  Future<LoginResponseModel> login(
      {required LoginPayloadModel loginPayload}) async {
    Map<String, dynamic> payload = loginPayload.toJson();

    Map<String, dynamic> response = await _remoteSource.logIn(payload: payload);

    LoginResponseModel loginResponse = LoginResponseModel.fromJson(response);

    return loginResponse;
  }

  @override
  Future<UserPreferencesModel?> getUserPreferences() async {
    String? response = await _localSource.getUserPreferences();

    // if no data saved local so bruh,,,, just return null <3
    if (response == null) return null;

    Map<String, dynamic> responseInMap = json.decode(response);

    UserPreferencesModel user = UserPreferencesModel.fromJson(responseInMap);

    return user;
  }

  @override
  Future<void> saveUserPreferences(
      {required UserPreferencesModel userPreferencesToSave}) async {
    Map<String, dynamic> userInfomationInMap = userPreferencesToSave.toJson();
    String userInfomationInString = jsonEncode(userInfomationInMap);

    await _localSource.saveUserPreferences(
        userPreferences: userInfomationInString);
  }

  @override
  Future<GetUserInformationsResponseModel> getUserInformations() async {
    // the payload is the token and it's already sent automaitcly by the dioFactory with the headers
    Map<String, dynamic> response = await _remoteSource.getUserInformations();

    GetUserInformationsResponseModel getReponse =
        GetUserInformationsResponseModel.fromJson(response);

    return getReponse;
  }

  @override
  Future<UpdateUserInformationsResponseModel> updateUserInformations(
      {required UpdateUserInformationsPayloadModel userToUpdate}) async {
    // the payload is the token and it's already sent automaitcly by the dioFactory with the headers
    Map<String, dynamic> payload = userToUpdate.toJson();

    Map<String, dynamic> response =
        await _remoteSource.updateUserInformations(payload: payload);

    UpdateUserInformationsResponseModel responseInModel =
        UpdateUserInformationsResponseModel.fromJson(response);

    return responseInModel;
  }

  @override
  Future<LogoutResponseModel> logout() async {
    Map<String, dynamic> response = await _remoteSource.logOut();
    LogoutResponseModel logoutResponseModel =
        LogoutResponseModel.fromJson(response);
    return logoutResponseModel;
  }

  @override
  Future<void> deleteAllUserPreferences() async {
    await _localSource.deleteAllUserPreferences();
  }
}
