import 'package:doctor_h_appointments_app/doctor_h_app.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  setUpGetIt(); // i always forgot this shit :)
  runApp( DoctorHApp(appRouter: AppRouter(),));
}