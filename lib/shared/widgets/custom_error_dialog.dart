import 'package:doctor_h_appointments_app/shared/extensions/navigation.dart';
import 'package:flutter/material.dart';

void customErrorDialog(BuildContext context ,{required String errorMessage}){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text( "Something Went Wrong"),
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        errorMessage,
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