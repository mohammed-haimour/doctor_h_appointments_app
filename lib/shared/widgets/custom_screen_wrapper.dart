import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomScreenWrapper extends StatelessWidget {
  final Widget child;
  const CustomScreenWrapper({super.key , required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: Constants.paddingForScreen,
          child: child
        ),
      );
  }
}
