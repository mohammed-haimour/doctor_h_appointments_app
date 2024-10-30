part of 'update_user_informations_cubit.dart';

class UpdateUserInformationsState {}

class UpdateUserInformationsInitial extends UpdateUserInformationsState {}

class UpdateUserInformationsLoading extends UpdateUserInformationsState {}

class UpdateUserInformationsFailure extends UpdateUserInformationsState {
  final String message;

  UpdateUserInformationsFailure({required this.message});
}

class UpdateUserInformationsSuccess extends UpdateUserInformationsState {
  final UpdateUserInformationsResultEntity response;

  UpdateUserInformationsSuccess({required this.response});
}
