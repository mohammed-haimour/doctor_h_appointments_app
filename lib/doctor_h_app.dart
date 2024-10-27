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
  final bool isUserStoredInTheLocalDb;
  const DoctorHApp({super.key, required this.appRouter, required this.isUserStoredInTheLocalDb});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetSaveUserInformationCubit(getIt<UserBusinessInterface>())..getUserInformation(),
      child:
          BlocBuilder<GetSaveUserInformationCubit, GetSaveUserInformationState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light(context),
            darkTheme: AppThemes.dark(context),
            themeMode: context
                    .read<GetSaveUserInformationCubit>()
                    .userInformation
                    ?.theme ??
                ThemeMode.light,
            initialRoute: (isUserStoredInTheLocalDb == true)
                ? Routes.logInScreen
                : Routes.onBoardingScreen,
            title: 'Doctor H App',
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
