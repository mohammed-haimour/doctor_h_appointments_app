import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

Future customBottomSheet(BuildContext context,
    {required List<Widget> children,
    bool isCloseAble = true,
    bool isScrollControlled = false}) async {
  return await showModalBottomSheet(
      isScrollControlled: isScrollControlled, // required for min/max child size
      isDismissible: isCloseAble,
      enableDrag: isCloseAble,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: Constants.paddingMedium,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        );
      });
}
