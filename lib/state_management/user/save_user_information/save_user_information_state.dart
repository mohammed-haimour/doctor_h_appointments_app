part of 'save_user_information_cubit.dart';

class SaveUserInformationState {}

class SaveUserInformationInitial extends SaveUserInformationState {}

class SaveUserInformationLoading extends SaveUserInformationState {}

class SaveUserInformationSuccess extends SaveUserInformationState {}

class SaveUserInformationFailure extends SaveUserInformationState {
  final String message;

  SaveUserInformationFailure({required this.message});
}
