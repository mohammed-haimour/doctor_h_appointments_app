import 'package:doctor_h_appointments_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:doctor_h_appointments_app/presentation/registration/create_account_screen.dart';
import 'package:doctor_h_appointments_app/presentation/registration/login_screen.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
<<<<<<< Updated upstream
=======
import 'package:doctor_h_appointments_app/state_management/user/create_account/create_account_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/login/login_cubit.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.createAccountScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create:(context) => CreateAccountCubit(getIt<UserBusinessInterface>()),
              child: const CreateAccountScreen()),
        );
      case Routes.logInScreen:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}