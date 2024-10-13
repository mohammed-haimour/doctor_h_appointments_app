import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_divider_with_text_in_center.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class RegistrationFooter extends StatelessWidget {
  const RegistrationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDividerWithTextInCenter(textInCenter: "or"),
        CustomSpace.vertical(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Do you have an account ?" , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorDarkGrey)),
            TextButton(onPressed: (){},  child: Text("Sign In", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorDarkBlueDoctorH)))
          ],
        )
      ],
    );
  }
}
