import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/shared/networking/api_contants.dart';
import 'package:doctor_h_appointments_app/shared/networking/http_methods.dart';

class DoctorsDataRemoteSource {
  final Dio _httpClient;
  DoctorsDataRemoteSource({required Dio httpClient}) : _httpClient = httpClient;

  Future<Map<String, dynamic>> getAllDoctors() 
  async{
    return await _httpClient.getMethod(endPoint: ApiConstants.getAllDoctors);
  }
}
