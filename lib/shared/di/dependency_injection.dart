import 'package:dio/dio.dart';
import 'package:doctor_h_appointments_app/business/doctors/doctors_business_implementation.dart';
import 'package:doctor_h_appointments_app/business/doctors/doctors_business_interface.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_implementation.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/doctors/data_sources/doctors_data_local_source.dart';
import 'package:doctor_h_appointments_app/data/doctors/data_sources/doctors_data_remote_source.dart';
import 'package:doctor_h_appointments_app/data/doctors/doctors_data_implementation.dart';
import 'package:doctor_h_appointments_app/data/doctors/doctors_data_interface.dart';
import 'package:doctor_h_appointments_app/data/user/data_sources/user_data_local_source.dart';
import 'package:doctor_h_appointments_app/data/user/data_sources/user_data_remote_source.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_implementation.dart';
import 'package:doctor_h_appointments_app/data/user/user_data_interface.dart';
import 'package:doctor_h_appointments_app/shared/local/secure_storage_factory.dart';
import 'package:doctor_h_appointments_app/shared/networking/dio_factory.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();
  FlutterSecureStorage localStorage = SecureStorageFactory.getStorage();

  /// user
  getIt.registerLazySingleton<UserDataInterface>(() => UserDataImplementation(
        remoteSource: UserDataRemoteSource(httpClient: dio),
        localSource: UserDataLocalSource(storage: localStorage),
      ));
  getIt.registerLazySingleton<UserBusinessInterface>(
      () => UserBusinessImplementation(userDataInterface: getIt()));

  // doctors
  getIt.registerLazySingleton<DoctorsDataInterface>(() =>
      DoctorsDataImplementation(
          remoteSource: DoctorsDataRemoteSource(httpClient: dio),
          localSource: DoctorsDataLocalSource()));
  getIt.registerLazySingleton<DoctorsBusinessInterface>(
      () => DoctorsBusinessImplementation(doctorsData: getIt()));
}
