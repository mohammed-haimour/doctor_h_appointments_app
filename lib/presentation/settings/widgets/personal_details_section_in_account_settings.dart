import 'package:doctor_h_appointments_app/business/user/entities/user_informations/get_user_informations_result_entity.dart';
import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_message_dialog.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_obscurable_form_field.dart.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_button_v2.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PersonalDetailsSectionInAccountSettings extends StatefulWidget {
  final GetUserInformationsResultEntity userInformations;

  const PersonalDetailsSectionInAccountSettings(
      {super.key, required this.userInformations});

  @override
  State<PersonalDetailsSectionInAccountSettings> createState() =>
      _PersonalDetailsSectionInAccountSettingsState();
}

class _PersonalDetailsSectionInAccountSettingsState
    extends State<PersonalDetailsSectionInAccountSettings> {
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Your Informations :"),
            CustomTextButtonV2(
                text: (isEditable) ? "Cancel" : "Edit",
                onClick: () {
                  setState(() {
                    isEditable = !isEditable;
                  });
                })
          ],
        ),
        CustomSpace.vertical(space: 10),
        CustomTextFormField(
          prefixIcon: Icons.person,
          hintText: "Name",
          validator: (p0) {},
          showLabel: true,
          isEnabled: isEditable,
          intialValue: widget.userInformations.name,
        ),
        CustomSpace.vertical(),
        CustomTextFormField(
            prefixIcon: Icons.phone,
            hintText: "Phone number",
            validator: (p0) {},
            showLabel: true,
            isEnabled: isEditable,
            intialValue: widget.userInformations.phoneNumber),
        CustomSpace.vertical(),
        CustomTextFormField(
            prefixIcon: Icons.email,
            hintText: "Email",
            validator: (p0) {},
            showLabel: true,
            isEnabled: isEditable,
            intialValue: widget.userInformations.email),
        CustomSpace.vertical(),
        CustomObscurableFormField(
            isAlwaysObsucured: true,
            prefixIcon: Icons.password,
            hintText: "Password",
            validator: (p0) {},
            showLabel: true,
            isEnabled: isEditable,
            intialValue:
                getIt<UserBusinessInterface>().userPreferences!.password),
        CustomSpace.vertical(),
        (isEditable)
            ? CustomButton(
                text: "Save",
                onPressed: () {
                  // there is a real problem in the end point that handels the update profile request once it's solved i will fix,,, srry
                  customMessageDialog(context,
                      message:
                          "We’re experiencing a temporary issue with the service that updates your profile. Once it’s resolved, we’ll update it here. Thank you for your patience!");
                })
            : const SizedBox.shrink()
      ],
    );
  }
}
