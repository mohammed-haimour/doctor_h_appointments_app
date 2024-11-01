import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> children;
  const SettingsSection(
      {super.key, required this.sectionTitle, required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: Constants.paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sectionTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            CustomSpace.vertical(space: 10),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: Constants.paddingMedium.copyWith(
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
