import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/data/user/create_account/models/create_account_payload_model.dart';
import 'package:doctor_h_appointments_app/data/user/create_account/models/create_account_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'api_contants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService{
  factory ApiService(Dio dio, {String? baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }
  
  @POST(ApiConstants.createAccount)
  Future<CreateAccountResponseModel> createAccount(@Body() CreateAccountPayloadModel createAccountPayload);
}