import 'package:doctor_h_appointments_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PagesController extends StatelessWidget {
  final PageController pagesController;
  final List<PagesModel> pages;
  const PagesController({super.key , required this.pagesController , required this.pages});
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          CustomButton(
              text: "Next",
              onPressed: (){
                pagesController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
              }
          ),
          CustomSpace.vertical(),
          SmoothPageIndicator(
              controller: pagesController, // PageController
              count: pages.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                dotColor: Constants.colorGrey,
                activeDotColor: Constants.colorDarkBlueDoctorH,
              ),
              onDotClicked: null
          ),
          const Spacer(),
          CustomTextButton(buttonText: "Skip", onPressed: (){}),
          const Spacer(),
        ],
      );
  }
}