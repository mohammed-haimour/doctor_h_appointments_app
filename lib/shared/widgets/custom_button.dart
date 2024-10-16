import 'package:doctor_h_appointments_app/shared/functions/helpers/screen_measurements.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final Function() onPressed;
  const CustomButton({required this.text, required this.onPressed, super.key,  this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (isFullWidth) ? double.infinity :ScreenMeasurements.width(context) / 1.25 ,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), // Increase this value for more rounded corners
          color: Constants.colorDarkBlueDoctorH,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(0),
            alignment: Alignment.center,
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 75, vertical: 15)),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Same radius here
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Constants.colorWhiteSmoke , fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
