import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/functions/helpers/screen_measurements.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final Function() onPressed;
  final Color? backGroundColor;
  final Color? textColor;
  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isFullWidth = false,
    this.backGroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (isFullWidth)
          ? double.infinity
          : ScreenMeasurements.width(context) / 1.25,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              30.0), // Increase this value for more rounded corners
          color: (backGroundColor != null)
              ? backGroundColor
              : ((getIt<UserBusinessInterface>().userPreferences?.theme ??
                          ThemeMode.light) ==
                      ThemeMode.light)
                  ? Constants.colorDarkBlueDoctorH
                  : Constants.colorLightBlueDoctorH,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(0),
            overlayColor:
                const WidgetStatePropertyAll(Color.fromARGB(10, 158, 158, 158)),
            alignment: Alignment.center,
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
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color:
                    (textColor != null) ? textColor : Constants.colorWhiteSmoke,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
