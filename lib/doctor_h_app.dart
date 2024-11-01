import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/routing/app_router.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/themes/app_themes.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_preferences/get_save_user_preferences_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_preferences/get_save_user_preferences_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHApp extends StatelessWidget {
  const DoctorHApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetSaveUserPreferencesCubit(getIt<UserBusinessInterface>()),
      child:
          BlocBuilder<GetSaveUserPreferencesCubit, GetSaveUserPreferencesState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light(context),
            darkTheme: AppThemes.dark(context),
            themeMode: getIt<UserBusinessInterface>().userPreferences?.theme ??
                ThemeMode.light,
            initialRoute:
                (getIt<UserBusinessInterface>().userPreferences == null)
                    ? Routes.onBoardingScreen
                    : (getIt<UserBusinessInterface>().userPreferences!.theme ==
                            null)
                        ? Routes.createAccountScreen
                        : Routes.logInScreen,
            title: 'Doctor H App',
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}

