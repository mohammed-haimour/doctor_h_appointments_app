import 'package:doctor_h_appointments_app/business/user/entities/user_preferences/user_preferences_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_app_theme_switch.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_bottom_sheet.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/state_management/user/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_save_user_preferences_state.dart';

class GetSaveUserPreferencesCubit extends Cubit<GetSaveUserPreferencesState> {
  final UserBusinessInterface _userBusiness;
  GetSaveUserPreferencesCubit(this._userBusiness)
      : super(GetSaveUserPreferencesInitial()) {
    getUserPreferences();
  }
  Future<void> saveUserPreferences(
      {required UserPreferencesEntity userPreferencesToSave}) async {
    emit(GetSaveUserPreferencesLoading());
    var result = await _userBusiness.saveUserPreferences(
        userPreferencesToSave: userPreferencesToSave);

    void ifFailure(Failure failure) =>
        emit(GetSaveUserPreferencesFailure(message: failure.message));

    void ifSuccess(void prm1) => getUserPreferences();

    result.fold(ifFailure, ifSuccess);
  }

  Future<void> getUserPreferences() async {
    emit(GetSaveUserPreferencesLoading());

    var result = await _userBusiness.getUserPreferences();

    void ifFailure(Failure failure) =>
        emit(GetSaveUserPreferencesFailure(message: failure.message));
    void ifSuccess(void prm1) {
      emit(GetSaveUserPreferencesSuccess());
    }

    result.fold(ifFailure, ifSuccess);
  }

  Future<void> selectYourTheme(BuildContext context) async {
    // Show the custom bottom sheet if userData is null
    if (getIt<UserBusinessInterface>().userPreferences == null) {
      await saveUserPreferences(
              userPreferencesToSave: UserPreferencesEntity(
                  email: null,
                  password: null,
                  theme: ThemeMode.light,
                  userName: null))
          .then(
        (value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customBottomSheet(context, isCloseAble: true, children: [
              const Icon(
                Icons.format_paint,
                size: 60,
              ),
              CustomSpace.vertical(),
              const Text(
                "Personalize Your Experiance",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              CustomSpace.vertical(),
              const Text("Choose App Theme"),
              CustomSpace.vertical(space: 10),
              const CustomAppThemeSwitch(),
            ]);
          });
        },
      );
    }
  }

  Future<void> autoLogIn(BuildContext context) async {
    if (getIt<UserBusinessInterface>().userPreferences?.isNotNull() ?? false) {
      context.read<LogInCubit>().logInWithSavedUserPreferences();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        customBottomSheet(context, isCloseAble: true, children: [
          const Icon(
            Icons.login,
            size: 60,
          ),
          CustomSpace.vertical(),
          const Text(
            "Loging You In",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          CustomSpace.vertical(),
          const Text("Please wait a moment"),
          CustomSpace.vertical(),
          const CircularProgressIndicator()
        ]);
      });
    }
  }
}
