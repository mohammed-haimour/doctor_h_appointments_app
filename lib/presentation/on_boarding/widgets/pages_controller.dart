import 'package:doctor_h_appointments_app/presentation/on_boarding/on_boarding_screen.dart';
import 'package:doctor_h_appointments_app/shared/extensions/navigation.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PagesController extends StatefulWidget {
  final PageController pagesController;
  final List<PagesModel> pages;
  const PagesController({super.key , required this.pagesController , required this.pages});

  @override
  State<PagesController> createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  int _pagesCounter = 1 ;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          CustomButton(
              text: "Next",
              onPressed: (){
                if(widget.pages.length == _pagesCounter){
                  context.pushReplacementNamed(Routes.createAccountScreen);
                }else{
                  widget.pagesController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  _pagesCounter += 1;
                }
              }
          ),
          CustomSpace.vertical(),
          SmoothPageIndicator(
              controller: widget.pagesController, // PageController
              count: widget.pages.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                dotColor: Constants.colorGrey,
                activeDotColor: Constants.colorDarkBlueDoctorH,
              ),
              onDotClicked: null
          ),
          const Spacer(),
          CustomTextButton(buttonText: "Skip", onPressed: (){context.pushReplacementNamed(Routes.createAccountScreen);}),
          const Spacer(),
        ],
      );
  }
}
