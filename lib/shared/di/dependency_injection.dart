import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_implementation.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/data_sources/user_data_local_source.dart';
import 'package:doctor_h_appointments_app/data/user/data_sources/user_data_remote_source.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_implementation.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_interface.dart';
import 'package:doctor_h_appointments_app/shared/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt()
async{
  Dio dio = DioFactory.getDio();

  /// user
  getIt.registerLazySingleton<UserDataInterface>(() => UserDataImplementation(
    remoteSource: UserDataRemoteSource(httpClient: dio),
    localSource: UserDataLocalSource(),
  ));
  getIt.registerLazySingleton<UserBusinessInterface>(() => UserBusinessImplementation(userDataInterface: getIt()));

}