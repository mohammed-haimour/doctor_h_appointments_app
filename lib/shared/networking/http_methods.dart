import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/shared/networking/api_contants.dart';

extension HttpMethods on Dio{

  Future<Map<String , dynamic>> getData({required String endPoint , required Map<String,dynamic> payload})
  async{

    var response = await get(
        "${ApiConstants.baseUrl}$endPoint",
        data: payload,
    );

    return response.data;
  }
}