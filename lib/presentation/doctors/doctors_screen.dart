import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_title_for_screens.dart';
import 'package:doctor_h_appointments_app/shared/widgets/doctors_bloc_builder.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreenWrapper(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitleForScreens(title: "Doctors"),
            CustomSpace.vertical(),
            const DoctorsBlocBuilder()
          ],
        ),
      )),
    );
  }
}
