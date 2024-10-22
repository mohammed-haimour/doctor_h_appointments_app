import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/shared/networking/api_contants.dart';
import 'package:doctor_h_appointments_app/shared/networking/http_methods.dart';

class UserDataRemoteSource{

  final Dio _httpClient;
  UserDataRemoteSource({required Dio httpClient}) : _httpClient = httpClient;

  Future<Map<String , dynamic>> logIn({required Map<String , dynamic> payload})
  async{
    return await _httpClient.getData(endPoint: ApiConstants.logIn , payload: payload);
  }

  Future<Map<String , dynamic>> createAccount({required Map<String , dynamic> payload})
  async{
    return await _httpClient.getData(endPoint: ApiConstants.createAccount , payload: payload);
  }

}