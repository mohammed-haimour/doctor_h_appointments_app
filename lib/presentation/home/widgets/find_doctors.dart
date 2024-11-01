import 'package:doctor_h_appointments_app/presentation/home/widgets/find_doctors_bloc_builder.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_button_v2.dart';
import 'package:flutter/material.dart';

class FindDoctors extends StatelessWidget {
  const FindDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Find Doctors",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              CustomTextButtonV2(
                  onClick: () {}, text: "Show More")
            ],
          ),
          CustomSpace.vertical(space: 10),
          const FindDoctorsBlocBuilder(),
        ],
      ),
    );
  }
}
