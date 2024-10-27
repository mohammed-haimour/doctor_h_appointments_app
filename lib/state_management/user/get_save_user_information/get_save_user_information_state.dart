class GetSaveUserInformationState {}

class GetSaveUserInformationInitial extends GetSaveUserInformationState {}

class GetSaveUserInformationLoading extends GetSaveUserInformationState {}

class GetSaveUserInformationFailure extends GetSaveUserInformationState {
  final String message;

  GetSaveUserInformationFailure({required this.message});
}

class GetSaveUserInformationSuccess extends GetSaveUserInformationState {}
