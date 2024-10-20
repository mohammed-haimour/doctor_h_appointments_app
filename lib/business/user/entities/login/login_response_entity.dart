import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';

class LoginResponseEntity{

  final String message;
  final String userName;

  LoginResponseEntity({required this.message , required this.userName});

  factory LoginResponseEntity.fromLoginResponseModel({required LoginResponseModel model}){
    return LoginResponseEntity(message: model.message , userName: model.userTokenData.username);
  }

}