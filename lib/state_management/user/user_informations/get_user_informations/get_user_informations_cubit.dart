import 'package:doctor_h_appointments_app/business/user/entities/user_informations/get_user_informations_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_informations_state.dart';

class GetUserInformationsCubit extends Cubit<GetUserInformationsState> {
  final UserBusinessInterface _userBusiness;

  GetUserInformationsCubit(this._userBusiness)
      : super(GetUserInformationsInitial());

  Future<void> getUserInformations() async {
    emit(GetUserInformationsLoading());
    var result = await _userBusiness.getUserInformations();

    void ifFailure(Failure failure) =>
        emit(GetUserInformationsFailure(message: failure.message));
    void ifSuccess(GetUserInformationsResultEntity entity) =>
        emit(GetUserInformationsSuccess(userInformations: entity));

    result.fold(ifFailure, ifSuccess);
  }
}
