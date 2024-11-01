import 'package:doctor_h_appointments_app/business/user/entities/user_informations/update_user_informations_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_informations/update_user_informations_payload_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_user_informations_state.dart';

class UpdateUserInformationsCubit extends Cubit<UpdateUserInformationsState> {
  final UserBusinessInterface _userBusiness;

  UpdateUserInformationsCubit(this._userBusiness)
      : super(UpdateUserInformationsInitial());

  Future<void> updateUserInformations({required UpdateUserInformationsPayloadModel userToUpdate}) async {
    emit(UpdateUserInformationsLoading());
    var result = await _userBusiness.updateUserInfornations(userToUpdate: userToUpdate);

    void ifFailure(Failure failure) =>
        emit(UpdateUserInformationsFailure(message: failure.message));
    void ifSuccess(UpdateUserInformationsResultEntity responseInEnitiy) =>
        emit(UpdateUserInformationsSuccess(response: responseInEnitiy));

    result.fold(ifFailure, ifSuccess);
  }
}
