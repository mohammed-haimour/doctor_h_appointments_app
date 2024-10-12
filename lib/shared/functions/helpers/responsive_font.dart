import 'package:flutter/material.dart';

abstract class ResponsiveFontSize {

  static double responsiveFontSize(
      BuildContext context, {
        required double fontSize,
        double smallScreenBreakpoint = 600,
        double mediumScreenBreakpoint = 900,
        double smallScreenScaleFactor = 400,
        double mediumScreenScaleFactor = 700,
        double largeScreenScaleFactor = 1000,
      }) {

    // Calculate screen width directly using MediaQuery
    double width = MediaQuery.of(context).size.width;

    // Determine scale factor based on screen size
    double scaleFactor;
    if (width < smallScreenBreakpoint) {
      scaleFactor = width / smallScreenScaleFactor;
    } else if (width < mediumScreenBreakpoint) {
      scaleFactor = width / mediumScreenScaleFactor;
    } else {
      scaleFactor = width / largeScreenScaleFactor;
    }

    // Calculate the responsive font size
    double responsiveFontSize = scaleFactor * fontSize;

    // Apply constraints to avoid the font size becoming too small or large
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.5;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }
}
