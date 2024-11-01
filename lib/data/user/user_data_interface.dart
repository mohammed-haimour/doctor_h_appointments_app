import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/logout/log_out_response.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/get_user_informations_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_response_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_preferences/user_preferences_model.dart';

abstract class UserDataInterface {
  Future<LoginResponseModel> login({required LoginPayloadModel loginPayload});
  Future<LogoutResponseModel> logout();

  Future<CreateAccountResponseModel> createAccount(
      {required CreateAccountPayloadModel createAccountPayload});
  Future<UserPreferencesModel?> getUserPreferences();
  Future<void> saveUserPreferences(
      {required UserPreferencesModel userPreferencesToSave});

  Future<void> deleteAllUserPreferences();

  Future<GetUserInformationsResponseModel> getUserInformations();

  Future<UpdateUserInformationsResponseModel> updateUserInformations(
      {required UpdateUserInformationsPayloadModel userToUpdate});
}
