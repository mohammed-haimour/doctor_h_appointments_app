import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingMedium,
      child: Column(
        children: [
          Column(
            children: [
              Text("Log In To Your Account" , style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)),
              CustomSpace.vertical(space: 5),
              Text("Welcome Back !" , style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w200))
            ],
          ),
          CustomSpace.vertical(space: 40),
          CustomTextFormField(hintText: "Your Email",prefixIcon: Icons.mail_rounded ,validator: (value){}),
          CustomSpace.vertical(),
          CustomTextFormField(hintText: "Password", prefixIcon: Icons.password, validator: (value){}),
          CustomSpace.vertical(),
          CustomButton(text: "Log In", onPressed: (){} , isFullWidth : true)
        ],
      ),
    );
  }
}
