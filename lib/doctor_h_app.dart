import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/routing/app_router.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/themes/app_themes.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHApp extends StatelessWidget {
  final AppRouter appRouter;
  const DoctorHApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetSaveUserInformationCubit(getIt<UserBusinessInterface>()),
      child:
          BlocBuilder<GetSaveUserInformationCubit, GetSaveUserInformationState>(
        builder: (context, state) {
          print(
              "email ${getIt<UserBusinessInterface>().userInformation?.email ?? "null"}");
          print(
              "theme ${getIt<UserBusinessInterface>().userInformation?.theme ?? "null"}");
          print(
              "ps ${getIt<UserBusinessInterface>().userInformation?.password ?? "null"}");
                        print(
              "token ${getIt<UserBusinessInterface>().userInformation?.token ?? "null"}");
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.light(context),
              darkTheme: AppThemes.dark(context),
              themeMode:
                  getIt<UserBusinessInterface>().userInformation?.theme ??
                      ThemeMode.light,
              initialRoute: (getIt<UserBusinessInterface>().userInformation == null)
                  ? Routes.onBoardingScreen
                  : (getIt<UserBusinessInterface>().userInformation!.theme == null)? Routes.createAccountScreen : (getIt<UserBusinessInterface>().userInformation!.email == null) ? Routes.logInScreen : Routes.homeScreen,
              title: 'Doctor H App',
              onGenerateRoute: appRouter.generateRoute,
            );
  
        },
      ),
    );
  }
}
