import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/doctor_h_app.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpGetIt(); // i always forgot this shit :)
  final bool isUserStoredInTheLocal = await getIt<UserBusinessInterface>()
      .isUserInformationStoredInTheLocalDb();

      
  runApp(DoctorHApp(
    appRouter: AppRouter(),
    isUserStoredInTheLocalDb: isUserStoredInTheLocal,
  ));
}
