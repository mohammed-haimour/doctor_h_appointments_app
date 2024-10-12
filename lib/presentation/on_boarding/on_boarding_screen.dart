import 'package:doctor_h_appointments_app/generated/assets.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages/1_welcome_to_doctor_h_app.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages/2_meet_doctors_online.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages/3_connect_with_specialists.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages/4_thousands_of_online_specialists.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages_controller.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pagesController;
  late final List<PagesModel> pages;

  @override
  void initState() {
    pagesController = PageController();

    pages = [
      PagesModel(imagePath: Assets.imageLogoDark, title: "Doctor H App", description: "Welcome To Doctor H App 👋, Your Easy Solution for Booking Appointments with Trusted Healthcare Professionals"),
      PagesModel(imagePath: Assets.imageOnboardingMan1, title: "Thousands of Online Specialists", description: " Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs."),
      PagesModel(imagePath: Assets.imageOnboardingWomen1, title: "Book An Appointment", description: "Book an Appointment Easily for Prompt and Personalized Healthcare Solutions."),
      PagesModel(imagePath: Assets.imageOnboardingWomen2, title: "Meet Doctors Online", description: "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations."),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex:4,child: Pages(pagesController: pagesController ,pages: pages,)),
          CustomSpace.vertical(),
          Flexible(child: PagesController(pagesController: pagesController ,pages: pages,)),
        ],
      )
    );
  }
}

class PagesModel{
  final String imagePath;
  final String title;
  final String description;

  PagesModel({required this.imagePath, required this.title, required this.description});
}
