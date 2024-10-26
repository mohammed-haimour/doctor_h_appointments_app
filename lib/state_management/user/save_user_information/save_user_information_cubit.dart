import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_information/user_information_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'save_user_information_state.dart';

class SaveUserInformationCubit extends Cubit<SaveUserInformationState> {
  final UserBusinessInterface _userBusiness;
  SaveUserInformationCubit(this._userBusiness)
      : super(SaveUserInformationInitial());

  Future<void> saveUserInformation(
      {required UserInformationModel userInformationToSave}) async {
    emit(SaveUserInformationLoading());
    var result = await _userBusiness.saveUserInformation(
        userToSave: userInformationToSave);

    void ifFailure(Failure failure)=>emit(SaveUserInformationFailure(message: failure.message));
    void ifSuccess(void prm1)=>emit(SaveUserInformationSuccess());

    result.fold(ifFailure, ifSuccess);
  }
}
