import 'package:doctor_h_appointments_app/business/user/entities/user_informations/get_user_informations_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_obscurable_form_field.dart.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_button_v2.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PersonalDetailsToShowAndUpdate extends StatelessWidget {
  final GetUserInformationsResultEntity userInformations;

  const PersonalDetailsToShowAndUpdate(
      {super.key, required this.userInformations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sign Out :"),
        CustomSpace.vertical(space: 10),
        CustomButton(
          text: "Sign Out !",
          onPressed: () {},
          backGroundColor: Constants.colorDoctorHRed,
        ),
        CustomSpace.vertical(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Your Informations :"),
            CustomTextButtonV2(text: "Edit", onClick: () {})
          ],
        ),
        CustomSpace.vertical(space: 10),
        CustomTextFormField(
          prefixIcon: Icons.person,
          hintText: "Name",
          validator: (p0) {},
          showLabel: true,
          isEnabled: false,
          intialValue: userInformations.name,
        ),
        CustomSpace.vertical(),
        CustomTextFormField(
            prefixIcon: Icons.phone,
            hintText: "Phone number",
            validator: (p0) {},
            showLabel: true,
            intialValue: userInformations.phoneNumber),
        CustomSpace.vertical(),
        CustomTextFormField(
            prefixIcon: Icons.email,
            hintText: "Email",
            validator: (p0) {},
            showLabel: true,
            intialValue: userInformations.email),
        CustomSpace.vertical(),
        CustomObscurableFormField(
            isAlwaysObsucured: true,
            prefixIcon: Icons.password,
            hintText: "Password",
            validator: (p0) {},
            showLabel: true,
            intialValue:
                getIt<UserBusinessInterface>().userPreferences!.password),
        CustomSpace.vertical(),
        // CustomButton(text: "Save", onPressed: () {})
      ],
    );
  }
}
