import 'package:doctor_h_appointments_app/business/user/entities/login/login_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LoginState> {

  final UserBusinessInterface _userBusiness;
  LogInCubit(this._userBusiness) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  dynamic emailValidation(value){
    if(value == null || value.isEmpty){
      return "Please enter the email";
    }else{
      if(EmailValidator.validate(value)){
        return null;
      }else{
        return "Please enter a valid email";
      }
    }
  }

  dynamic passwordValidation(value){
    if(value == null || value.isEmpty){
      return "Please enter the password";
    }else{
      return null;
    }
  }

  LoginPayloadModel? validatingAndModelingInPayLoadModel(){
    if(formKey.currentState!.validate()){
      // modeling
      return LoginPayloadModel(email: emailFieldController.text, password: passwordFieldController.text);
    }else{
      //cancel
      return null;
    }
  }


  Future<void> login()
  async{
    LoginPayloadModel ? payload = validatingAndModelingInPayLoadModel();

    if(payload == null) return;

    emit(LoginLoading());

    var result = await _userBusiness.logIn(loginPayload: payload);

    void ifError(Failure failure)=>emit(LoginFailure(message: failure.message));
    void ifSuccess(LoginResultEntity entity)=>emit(LoginSuccess(loginResponseEntity: entity));

    result.fold(
          ifError,
          ifSuccess,
    );
  }

  @override
  Future<void> close() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    return super.close();
  }
}
