import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/user/models/user_information/user_information_model.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_information_state.dart';

class GetUserInformationCubit extends Cubit<GetUserInformationState> {
  final UserBusinessInterface _userBusiness;

  GetUserInformationCubit(this._userBusiness)
      : super(GetUserInformationInitial());

  Future<void> getUserInformation() async {
    emit(GetUserInformationLoading());

    var result = await _userBusiness.getUserInformation();

    void ifFailure(Failure failure) =>
        emit(GetUserInformationFailure(message: failure.message));
    void ifSuccess(UserInformationModel? userModel) =>
        emit(GetUserInformationSuccess(user: userModel));

    result.fold(ifFailure, ifSuccess);
  }
}
