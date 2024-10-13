import 'package:doctor_h_appointments_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:doctor_h_appointments_app/presentation/registration/create_account_screen.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.createAccountScreen:
        return MaterialPageRoute(
          builder: (_) => const  CreateAccountScreen(),
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