import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingMedium,
      child: Column(
        children: [
          Column(
            children: [
              Text("Create Account" , style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)),
              CustomSpace.vertical(space: 5),
              Text("We are here to help you!" , style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w200))
            ],
          ),
          CustomSpace.vertical(space: 40),
          CustomTextFormField(hintText: "Your Name", prefixIcon: Icons.person ,validator: (value){}),
          CustomSpace.vertical(),
          CustomTextFormField(hintText: "Your Email",prefixIcon: Icons.mail_rounded ,validator: (value){}),
          CustomSpace.vertical(),
          CustomTextFormField(hintText: "Password", prefixIcon: Icons.password, validator: (value){}),
          CustomSpace.vertical(),
          CustomButton(text: "Create Account", onPressed: (){} , isFullWidth : true)
        ],
      ),
    );
  }
}
