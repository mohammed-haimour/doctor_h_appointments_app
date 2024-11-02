import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
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
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    prefixIcon: Icons.search,
                    hintText: "Search For a Docotor",
                    validator: (v) {},
                    backgroundColor: Constants.colorWhiteBlueVeryLight,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_rounded,
                      size: 35,
                    ))
              ],
            ),
            const DoctorsBlocBuilder()
          ],
        ),
      )),
    );
  }
}
