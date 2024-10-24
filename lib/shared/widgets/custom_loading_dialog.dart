import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:flutter/material.dart';

void customLoadingDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible : false,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: Constants.colorDarkBlue,
        ),
      );
    },
  );
}