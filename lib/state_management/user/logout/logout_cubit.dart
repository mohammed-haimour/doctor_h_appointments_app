import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final UserBusinessInterface _userBusiness;
  LogoutCubit(this._userBusiness) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    var result = await _userBusiness.logout();

    void ifFailure(Failure failure) =>
        emit(LogoutFailure(message: failure.message));
    void ifSuccess(prm1) => emit(LogoutSuccess());
    result.fold(ifFailure, ifSuccess);
  }
}
