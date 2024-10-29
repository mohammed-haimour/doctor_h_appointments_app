import 'package:doctor_h_appointments_app/business/user/entities/user_information/user_information_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_app_theme_switch.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_bottom_sheet.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_save_user_information_state.dart';

class GetSaveUserInformationCubit extends Cubit<GetSaveUserInformationState> {
  final UserBusinessInterface _userBusiness;
  GetSaveUserInformationCubit(this._userBusiness)
      : super(GetSaveUserInformationInitial()) {
    getUserInformation();
  }
  Future<void> saveUserInformation(
      {required UserInformationEntity userInformationToSave}) async {
    emit(GetSaveUserInformationLoading());
    var result = await _userBusiness.saveUserInformation(
        userToSave: userInformationToSave);

    void ifFailure(Failure failure) =>
        emit(GetSaveUserInformationFailure(message: failure.message));

    void ifSuccess(void prm1) => getUserInformation();

    result.fold(ifFailure, ifSuccess);
  }

  Future<void> getUserInformation() async {
    emit(GetSaveUserInformationLoading());

    var result = await _userBusiness.getUserInformation();

    void ifFailure(Failure failure) =>
        emit(GetSaveUserInformationFailure(message: failure.message));
    void ifSuccess(void prm1) {
      emit(GetSaveUserInformationSuccess());
    }

    result.fold(ifFailure, ifSuccess);
  }

  Future<void> selectYourTheme(BuildContext context) async{
    // Show the custom bottom sheet if userData is null
    if (getIt<UserBusinessInterface>().userInformation == null) {
      await saveUserInformation(
          userInformationToSave: UserInformationEntity(
              email: null, password: null, theme: ThemeMode.light,token: null));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        customBottomSheet(context, isCloseAble: true, children: [
          const Icon(
            Icons.format_paint,
            size: 60,
          ),
          CustomSpace.vertical(),
          Text("Personalize Your Experiance",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600)),
          CustomSpace.vertical(),
          const Text("Choose App Theme"),
          CustomSpace.vertical(space: 10),
          const CustomAppThemeSwitch(),
        ]);
      });
    }
  }
}
