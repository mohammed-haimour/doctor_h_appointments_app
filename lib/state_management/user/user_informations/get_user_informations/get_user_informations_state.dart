part of 'get_user_informations_cubit.dart';

class GetUserInformationsState {}

class GetUserInformationsInitial extends GetUserInformationsState {}

class GetUserInformationsLoading extends GetUserInformationsState {}

class GetUserInformationsFailure extends GetUserInformationsState {
  final String message;

  GetUserInformationsFailure({required this.message});
}

class GetUserInformationsSuccess extends GetUserInformationsState {
  final GetUserInformationsResultEntity userInformations;

  GetUserInformationsSuccess({required this.userInformations});
}
