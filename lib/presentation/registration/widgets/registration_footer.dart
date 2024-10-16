import 'package:doctor_h_appointments_app/presentation/on_boarding/widgets/pages_controller.dart';
import 'package:doctor_h_appointments_app/presentation/registration/enums/registration_type_enum.dart';
import 'package:doctor_h_appointments_app/shared/extensions/navigation.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_divider_with_text_in_center.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class RegistrationFooter extends StatelessWidget {
  final RegistrationTypeEnum registrationType;
  const RegistrationFooter({super.key , required this.registrationType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDividerWithTextInCenter(textInCenter: "or"),
        CustomSpace.vertical(),

        if(registrationType == RegistrationTypeEnum.createAccount)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Do you have an account ?" , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorDarkGrey)),
              TextButton(onPressed: (){context.pushReplacementNamed(Routes.logInScreen);},  child: Text("Log In", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorDarkBlueDoctorH)))
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("If You Don't Have An Account " , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorDarkGrey)),
              TextButton(onPressed: (){context.pushReplacementNamed(Routes.createAccountScreen);},  child: Text("Create One !", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Constants.colorDarkBlueDoctorH)))
            ],
          )
      ],
    );
  }
}
