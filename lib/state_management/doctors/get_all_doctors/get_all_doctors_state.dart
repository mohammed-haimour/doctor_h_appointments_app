part of 'get_all_doctors_cubit.dart';

class GetAllDoctorsState {}

class GetAllDoctorsInitial extends GetAllDoctorsState {}

class GetAllDoctorsLoading extends GetAllDoctorsState {}

class GetAllDoctorsSuccess extends GetAllDoctorsState {
  final GetAllDoctorsResultEntity getAllDoctorsResultEntity;

  GetAllDoctorsSuccess({required this.getAllDoctorsResultEntity});
}

class GetAllDoctorsFailure extends GetAllDoctorsState {
  final String message;

  GetAllDoctorsFailure({required this.message});
}
