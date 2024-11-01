import 'package:doctor_h_appointments_app/presentation/home/widgets/categories.dart';
import 'package:doctor_h_appointments_app/presentation/home/widgets/find_doctors.dart';
import 'package:doctor_h_appointments_app/presentation/home/widgets/home_top_bar.dart';
import 'package:doctor_h_appointments_app/presentation/home/widgets/poster.dart';
import 'package:doctor_h_appointments_app/presentation/home/widgets/services.dart';
import 'package:doctor_h_appointments_app/shared/local/secure_storage_factory.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreenWrapper(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HomeTopBar(),
              CustomSpace.vertical(space: 20),
              const Poster(),
              CustomSpace.vertical(),
              const Categories(),
              CustomSpace.vertical(),
              const FindDoctors(),
              CustomSpace.vertical(),
              const Services()
            ],
          ),
        ),
      ),
    );
  }
}
