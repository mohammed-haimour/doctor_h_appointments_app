import 'package:doctor_h_appointments_app/data/user/models/logout/log_out_response.dart';

class LogOutResultEntity {
  final String message;

  LogOutResultEntity({required this.message});

  factory LogOutResultEntity.fromLogoutResponseModel(
      {required LogoutResponseModel logoutReponseModel}) {
    return LogOutResultEntity(message: logoutReponseModel.message);
  }
}
