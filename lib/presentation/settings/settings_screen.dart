import 'package:doctor_h_appointments_app/presentation/settings/widgets/edit_personal_details_section.dart';
import 'package:doctor_h_appointments_app/presentation/settings/widgets/settings_section.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_app_theme_switch.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_title_for_screens.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreenWrapper(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitleForScreens(title: "Settings"),
            CustomSpace.vertical(),
            const SettingsSection(
                sectionTitle: "App Settings",
                children: [Text("Theme :"), CustomAppThemeSwitch()]),
            CustomSpace.vertical(),
            const EditPersonalDetailsSection(),
          ],
        ),
      )),
    );
  }
}
