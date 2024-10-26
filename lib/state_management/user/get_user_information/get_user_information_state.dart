part of 'get_user_information_cubit.dart';

class GetUserInformationState {}

class GetUserInformationInitial extends GetUserInformationState {}

class GetUserInformationLoading extends GetUserInformationState {}

class GetUserInformationFailure extends GetUserInformationState {
  final String message;

  GetUserInformationFailure({required this.message});
}

class GetUserInformationSuccess extends GetUserInformationState {
  final UserInformationModel ?user;

  GetUserInformationSuccess({required this.user});
}
