import 'package:doctor_h_appointments_app/shared/extensions/navigation_extenstions.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

void customMessageDialog(BuildContext context ,{required String message}){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text( "Something Went Wrong"),
      icon: const Icon(
        Icons.error,
        color: Constants.colorDoctorHRed,
        size: 32,
      ),
      content: Text(
        message,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
}