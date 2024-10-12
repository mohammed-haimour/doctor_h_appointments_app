import 'package:doctor_h_appointments_app/shared/functions/helpers/responsive_font.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      primaryColor: Constants.colorDarkBlueDoctorH,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Constants.colorBlack),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        ),
      ),
      fontFamily: "Museo Sans", // Updated to Museo Sans
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Constants.colorWhiteSmoke,
      ),
      scaffoldBackgroundColor: Constants.colorWhiteSmoke,
      primaryColorLight: Constants.colorDarkBlueDoctorH,
      highlightColor: Constants.colorLightBlueDoctorH,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Constants.colorDarkBlueDoctorH,
        onPrimary: Constants.colorLightBlueDoctorH,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Constants.colorWhiteSmoke,
        rangeSelectionBackgroundColor: Colors.red,
        dividerColor: Colors.blue,
        headerBackgroundColor: Constants.colorLightBlueDoctorH,
        headerForegroundColor: Constants.colorBlack,
        headerHeadlineStyle: Theme.of(context).textTheme.headlineLarge,
        yearBackgroundColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        yearForegroundColor: const WidgetStatePropertyAll(Constants.colorBlack),
        yearOverlayColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        weekdayStyle: const TextStyle(color: Constants.colorDarkBlueDoctorH, fontWeight: FontWeight.w500),
        todayForegroundColor: const WidgetStatePropertyAll(Constants.colorBlack),
        dayForegroundColor: const WidgetStatePropertyAll(Constants.colorBlack),
        dayOverlayColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        todayBackgroundColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        todayBorder: const BorderSide(color: Constants.colorRed, width: 0),
        rangePickerShadowColor: Colors.pink,
        rangePickerHeaderForegroundColor: Colors.yellow,
        rangePickerBackgroundColor: Colors.red,
      ),
      textTheme: TextTheme(

        // body fonts
        bodySmall: TextStyle(
          color: Constants.colorBlack,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 14),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        bodyMedium: TextStyle(
          color: Constants.colorBlack,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 16),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        bodyLarge: TextStyle(
          color: Constants.colorBlack,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 20),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),

        // headline fonts
        headlineSmall: TextStyle(
          color: Constants.colorBlack,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 25),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        headlineMedium: TextStyle(
          color: Constants.colorBlack,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 35),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        headlineLarge: TextStyle(
          color: Constants.colorBlack,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 50),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),

      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(TextStyle(color: Constants.colorBlack, fontSize: 16)),
          overlayColor: WidgetStatePropertyAll(Constants.colorTransparentBlack),
          backgroundColor: WidgetStatePropertyAll(Constants.colorDarkBlueDoctorH),
          shadowColor: WidgetStatePropertyAll(Constants.colorBlue),
          foregroundColor: WidgetStatePropertyAll(Constants.colorWhiteSmoke),
          padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
        ),
      ),
      iconTheme: const IconThemeData(color: Constants.colorDarkBlueDoctorH),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      primaryColor: Constants.colorLightBlueDoctorH,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Constants.colorWhite),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        ),
      ),
      iconTheme: const IconThemeData(color: Constants.colorDarkBlueDoctorH),
      fontFamily: "Museo Sans", // Updated to Museo Sans
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Constants.colorLightBlack,
      ),
      scaffoldBackgroundColor: Constants.colorLightBlack,
      colorScheme: const ColorScheme.dark(
        primary: Constants.colorDarkBlueDoctorH,
        onPrimary: Constants.colorLightBlueDoctorH,
      ),
      primaryColorLight: Constants.colorDarkBlueDoctorH,
      highlightColor: Constants.colorLightBlueDoctorH,
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Constants.colorBlack,
        rangeSelectionBackgroundColor: Colors.red,
        dividerColor: Colors.blue,
        headerBackgroundColor: Constants.colorDarkBlueDoctorH,
        headerForegroundColor: Constants.colorWhite,
        headerHeadlineStyle: Theme.of(context).textTheme.headlineLarge,
        yearBackgroundColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        yearForegroundColor: const WidgetStatePropertyAll(Constants.colorWhite),
        yearOverlayColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        weekdayStyle: const TextStyle(color: Constants.colorDarkBlueDoctorH, fontWeight: FontWeight.w500),
        todayForegroundColor: const WidgetStatePropertyAll(Constants.colorWhite),
        dayForegroundColor: const WidgetStatePropertyAll(Constants.colorWhite),
        dayOverlayColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        todayBackgroundColor: const WidgetStatePropertyAll(Constants.colorLightBlueDoctorH),
        todayBorder: const BorderSide(color: Constants.colorRed, width: 0),
        rangePickerShadowColor: Colors.pink,
        rangePickerHeaderForegroundColor: Colors.yellow,
        rangePickerBackgroundColor: Colors.red,
      ),
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodySmall: TextStyle(
          color: Constants.colorWhiteSmoke,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 14),
          fontWeight: FontWeight.w300,
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        bodyMedium: TextStyle(
          color: Constants.colorWhiteSmoke,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 16),
          fontWeight: FontWeight.w300,
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        bodyLarge: TextStyle(
          color: Constants.colorWhiteSmoke,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 20),
          fontWeight: FontWeight.w300,
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        headlineSmall: TextStyle(
          color: Constants.colorWhiteSmoke,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 25),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        headlineMedium: TextStyle(
          color: Constants.colorWhiteSmoke,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 35),
          fontWeight: FontWeight.w300,
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
        headlineLarge: TextStyle(
          color: Constants.colorWhiteSmoke,
          fontSize: ResponsiveFontSize.responsiveFontSize(context, fontSize: 50),
          fontFamily: "Museo Sans", // Use Museo Sans
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(TextStyle(color: Constants.colorBlack, fontSize: 16)),
          backgroundColor: WidgetStatePropertyAll(Constants.colorBlack),
          overlayColor: WidgetStatePropertyAll(Constants.colorDarkBlueDoctorH),
          foregroundColor: WidgetStatePropertyAll(Constants.colorWhiteSmoke),
          padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
        ),
      ),
    );
  }
}
