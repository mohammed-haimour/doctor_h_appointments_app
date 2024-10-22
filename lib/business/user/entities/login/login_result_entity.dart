import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';

class LoginResultEntity{

  final String message;
  final String userName;

  LoginResultEntity({required this.message , required this.userName});

  factory LoginResultEntity.fromLoginResponseModel({required LoginResponseModel model}){
    return LoginResultEntity(message: model.message , userName: model.userDataAndToken.username);
  }

}