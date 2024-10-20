import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/business/user/entities/login/login_response_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_reponse_model.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_interface.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';

class UserBusinessImplementation implements UserBusinessInterface{

  final UserDataInterface _userData;

  UserBusinessImplementation({required UserDataInterface userDataInterface}) : _userData = userDataInterface;

  @override
  Future<Either<Failure, LoginResponseEntity>> login({required LoginPayloadModel loginPayload})
  async{

    try{

      LoginResponseModel responseModel = await _userData.login(loginPayload: loginPayload);

      LoginResponseEntity loginResponseEntity = LoginResponseEntity.fromLoginResponseModel(model: responseModel);

      return right(loginResponseEntity);

    }on Exception catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }


  }

}