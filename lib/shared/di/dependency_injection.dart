import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/shared/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.instance;

Future<void> setUpGetIt()
async{
  Dio dio = DioFactory.getDio();

}