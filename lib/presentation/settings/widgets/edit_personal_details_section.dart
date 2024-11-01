import 'package:doctor_h_appointments_app/presentation/settings/widgets/edit_personal_details_section_bloc_consumer.dart';
import 'package:doctor_h_appointments_app/presentation/settings/widgets/logout_section_in_account_settings.dart';
import 'package:doctor_h_appointments_app/presentation/settings/widgets/settings_section.dart';
import 'package:flutter/material.dart';

class EditPersonalDetailsSection extends StatelessWidget {
  const EditPersonalDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsSection(sectionTitle: "Account Settings", children: [
      LogoutSectionInAccountSettings(),
      EditPersonalDetailsSectionBlocBuilder()
    ]);
  }
}
