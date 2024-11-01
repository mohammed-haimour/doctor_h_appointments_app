import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/doctor_h_app.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    // ignore: avoid_print
    print('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    // ignore: avoid_print
    print('Bloc Closed: ${bloc.runtimeType}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  setUpGetIt(); // i always forgot this shit :)
  await getIt<UserBusinessInterface>().getUserPreferences();

  runApp(const DoctorHApp());
}
