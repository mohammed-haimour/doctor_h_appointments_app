import 'package:doctor_h_appointments_app/business/doctors/doctors_business_interface.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/presentation/book_an_appointment/book_an_appointment_screen.dart';
import 'package:doctor_h_appointments_app/presentation/doctors/doctors_screen.dart';
import 'package:doctor_h_appointments_app/presentation/home/home_screen.dart';
import 'package:doctor_h_appointments_app/presentation/main_bottom_nav_bar/main_bottom_nav_bar.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:doctor_h_appointments_app/presentation/registration/create_account_screen.dart';
import 'package:doctor_h_appointments_app/presentation/registration/login_screen.dart';
import 'package:doctor_h_appointments_app/presentation/settings/settings_screen.dart';
import 'package:doctor_h_appointments_app/presentation/specializations/specializations_screen.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/state_management/doctors/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/create_account/create_account_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/login/login_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/logout/logout_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/user_informations/get_user_informations/get_user_informations_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/user_informations/update_user_informations/update_user_informations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.createAccountScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) =>
                  CreateAccountCubit(getIt<UserBusinessInterface>()),
              child: const CreateAccountScreen()),
        );
      case Routes.logInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => LogInCubit(getIt<UserBusinessInterface>()),
              child: const LogInScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.doctorsScreen:
        return MaterialPageRoute(
          builder: (_) => const DoctorsScreen(),
        );

      case Routes.bookAnAppointment:
        return MaterialPageRoute(
          builder: (_) => const BookAnAppointmentScreen(),
        );

      case Routes.mainBottomNavBar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                GetAllDoctorsCubit(getIt<DoctorsBusinessInterface>())
                  ..getAllDoctors(),
            child: const MainBottomNavBar(),
          ),
        );

      case Routes.specializations:
        return MaterialPageRoute(
          builder: (_) => const SpecializationsScreen(),
        );

      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      GetUserInformationsCubit(getIt<UserBusinessInterface>())
                        ..getUserInformations()),
              BlocProvider(
                  create: (context) => UpdateUserInformationsCubit(
                      getIt<UserBusinessInterface>())),
              BlocProvider(
                  create: (context) =>
                      LogoutCubit(getIt<UserBusinessInterface>())),
            ],
            child: const SettingsScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
