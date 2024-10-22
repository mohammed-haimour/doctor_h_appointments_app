import 'package:doctor_h_appointments_app/business/user/entities/login/login_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/login/login_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final UserBusinessInterface _userBusiness;
  LoginCubit(this._userBusiness) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  Future<void> login({required LoginPayloadModel payload})
  async{
    emit(LoginLoading());

    var result = await _userBusiness.logIn(loginPayload: payload);

    void ifError(Failure failure)=>emit(LoginFailure(message: failure.message));
    void ifSuccess(LoginResultEntity entity)=>emit(LoginSuccess(loginResponseEntity: entity));

    result.fold(
          ifError,
          ifSuccess,
    );
  }

}
