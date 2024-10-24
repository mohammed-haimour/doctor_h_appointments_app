import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_response_model.dart';

class CreateAccountResultEntity{

  final String message;
  final String userName;

  CreateAccountResultEntity({required this.message , required this.userName});

  factory CreateAccountResultEntity.fromCreateAccountResponseModel({required CreateAccountResponseModel model}){
    return CreateAccountResultEntity(message: model.message , userName: model.userDataAndToken.username);
  }

}