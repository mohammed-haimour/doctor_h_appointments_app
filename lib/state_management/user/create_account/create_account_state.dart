
import 'package:doctor_h_appointments_app/business/user/entities/create_account/create_account_result_entity.dart';

class CreateAccountState {}

class CreateAccountInitial extends CreateAccountState {}
class CreateAccountLoading extends CreateAccountState {}
class CreateAccountFailure extends CreateAccountState {
  final String message;

  CreateAccountFailure({required this.message});
}
class CreateAccountSuccess extends CreateAccountState {
  final CreateAccountResultEntity createAccountResultEntity;

  CreateAccountSuccess({required this.createAccountResultEntity});
}