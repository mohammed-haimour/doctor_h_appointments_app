import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        padding: Constants.paddingBiggerThanMedium,
        decoration: BoxDecoration(
            borderRadius: Constants.radiusMedium,
            color: Constants.colorLightGrey),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
