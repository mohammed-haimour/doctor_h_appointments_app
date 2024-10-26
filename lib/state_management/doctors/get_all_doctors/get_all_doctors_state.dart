part of 'get_all_doctors_cubit.dart';

class GetAllDoctorsState {}

class GetAllDoctorsInitial extends GetAllDoctorsState {}

class GetAllDoctorsLoading extends GetAllDoctorsState {}

class GetAllDoctorsSuccess extends GetAllDoctorsState {
  final GetAllDoctorsResponseModel getAllDoctorsReponseModel;

  GetAllDoctorsSuccess({required this.getAllDoctorsReponseModel});
}

class GetAllDoctorsFailure extends GetAllDoctorsState {
  final String message;

  GetAllDoctorsFailure({required this.message});
}
