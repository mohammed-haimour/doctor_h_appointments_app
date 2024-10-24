import 'package:doctor_h_appointments_app/business/user/entities/create_account/create_account_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/create_account/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_account_state.dart';


class CreateAccountCubit extends Cubit<CreateAccountState> {

  final UserBusinessInterface _userBusiness;
  CreateAccountCubit(this._userBusiness) : super(CreateAccountInitial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController phoneNumberFieldController = TextEditingController();

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

  dynamic nameValidation(value){
    if(value == null || value.isEmpty){
      return "Please enter your name";
    }else{
      return null;
    }
  }

  dynamic phoneNumberValidation(value) {
    final phoneRegExp = RegExp(r'^\d+$');

    if (value == null || value.isEmpty) {
      return "Please enter your phone number";
    } else if (!phoneRegExp.hasMatch(value)) {
      return "Phone number must contain only digits";
    } else if (value.length < 10) {
      return "Phone number is too short";
    } else {
      return null;
    }
  }


  CreateAccountPayloadModel? validatingAndModelingInPayLoadModel(){
    if(formKey.currentState!.validate()){
      // modeling
      return CreateAccountPayloadModel(email: emailFieldController.text, password: passwordFieldController.text, name: nameFieldController.text, phone: phoneNumberFieldController.text , gender: "0", passwordConfirmation: passwordFieldController.text);
    }else{
      //cancel
      return null;
    }
  }


  Future<void> createAccount()
  async{
    CreateAccountPayloadModel ? payload = validatingAndModelingInPayLoadModel();

    if(payload == null) return;

    emit(CreateAccountLoading());

    var result = await _userBusiness.createAccount(createAccountPayload: payload);

    void ifError(Failure failure)=>emit(CreateAccountFailure(message: failure.message));
    void ifSuccess(CreateAccountResultEntity entity)=>emit(CreateAccountSuccess(createAccountResultEntity: entity));

    result.fold(
          ifError,
          ifSuccess,
    );
  }

  @override
  Future<void> close() {
    emailFieldController.dispose();
    passwordFieldController.dispose();
    nameFieldController.dispose();
    phoneNumberFieldController.dispose();
    return super.close();
  }
}
