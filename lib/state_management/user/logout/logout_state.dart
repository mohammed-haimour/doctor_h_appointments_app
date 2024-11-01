part of 'logout_cubit.dart';

class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutFailure extends LogoutState {
  final String message;

  LogoutFailure({required this.message});
}

class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}
