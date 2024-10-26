// ignore_for_file: unused_field

import 'package:doctor_h_appointments_app/data/doctors/data_sources/doctors_data_local_source.dart';
import 'package:doctor_h_appointments_app/data/doctors/data_sources/doctors_data_remote_source.dart';
import 'package:doctor_h_appointments_app/data/doctors/doctors_data_interface.dart';
import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';

class DoctorsDataImplementation implements DoctorsDataInterface {
  final DoctorsDataRemoteSource _remoteSource;
  final DoctorsDataLocalSource _localSource;

  DoctorsDataImplementation(
      {required DoctorsDataRemoteSource remoteSource,
      required DoctorsDataLocalSource localSource})
      : _remoteSource = remoteSource,
        _localSource = localSource;

  @override
  Future<GetAllDoctorsResponseModel> getAllDoctors() async {
    Map<String, dynamic> response = await _remoteSource.getAllDoctors();

    GetAllDoctorsResponseModel getAllDoctorsModel =
        GetAllDoctorsResponseModel.fromJson(response);

    return getAllDoctorsModel;
  }
}
