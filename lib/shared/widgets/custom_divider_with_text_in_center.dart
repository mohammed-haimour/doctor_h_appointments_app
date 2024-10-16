import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

class CustomDividerWithTextInCenter extends StatelessWidget {
  final String textInCenter;
  const CustomDividerWithTextInCenter({super.key , required this.textInCenter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              textInCenter,
              style: const TextStyle(
                color: Constants.colorDarkGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
