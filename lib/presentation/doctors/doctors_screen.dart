import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScreenWrapper(child: Center(child: Text("Doctors"),)),
    );
  }
}
