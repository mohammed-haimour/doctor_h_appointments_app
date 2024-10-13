import 'package:doctor_h_appointments_app/generated/assets.dart';
import 'package:doctor_h_appointments_app/shared/functions/helpers/screen_measurements.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(Assets.imageLogoDark , width: ScreenMeasurements.width(context)/5,),
            CustomSpace.vertical(space: 5),
            Text("Doctor H" , style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w300))
          ],
        ),
      ],
    );
  }
}
