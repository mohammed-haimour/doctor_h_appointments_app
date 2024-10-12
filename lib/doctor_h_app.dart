import 'package:doctor_h_appointments_app/shared/routing/app_router.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/themes/app_themes.dart';
import 'package:flutter/material.dart';

class DoctorHApp extends StatelessWidget {
  final AppRouter appRouter;
  const DoctorHApp({super.key , required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light(context),
      darkTheme: AppThemes.dark(context),
      themeMode: ThemeMode.light,
      title: 'Doctor H App',
      initialRoute: Routes.onBoardingScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
