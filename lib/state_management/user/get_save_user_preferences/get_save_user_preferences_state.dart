class GetSaveUserPreferencesState {}

class GetSaveUserPreferencesInitial extends GetSaveUserPreferencesState {}

class GetSaveUserPreferencesLoading extends GetSaveUserPreferencesState {}

class GetSaveUserPreferencesFailure extends GetSaveUserPreferencesState {
  final String message;

  GetSaveUserPreferencesFailure({required this.message});
}

class GetSaveUserPreferencesSuccess extends GetSaveUserPreferencesState {}
