import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomTextButtomV2 extends StatelessWidget {
  final String text;
  final void Function() onClick;
  const CustomTextButtomV2(
      {super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        text,
        style: TextStyle(
          color: ((getIt<UserBusinessInterface>().userInformation?.theme ??
                      ThemeMode.light) ==
                  ThemeMode.light)
              ? Constants.colorDarkBlueDoctorH
              : const Color.fromARGB(255, 84, 145, 214),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
