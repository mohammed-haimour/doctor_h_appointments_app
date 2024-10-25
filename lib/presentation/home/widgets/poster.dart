import 'package:flutter/material.dart';
import 'package:doctor_h_appointments_app/generated/assets.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';

class Poster extends StatelessWidget {
  const Poster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.paddingMedium,
      height: 463,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: Constants.radiusMedium,
        color: Constants.colorDarkBlueDoctorH,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.colorDarkBlueDoctorH,
              Constants.colorDarkBlueDoctorH.withOpacity(0.9),
              Constants.colorDarkBlueDoctorH.withOpacity(0.8),
              Constants.colorDarkBlueDoctorH.withOpacity(0.7),
              Constants.colorDarkBlueDoctorH.withOpacity(0.6),
              Constants.colorDarkBlueDoctorH.withOpacity(0.5),
              Constants.colorDarkBlueDoctorH.withOpacity(0.4),
              Constants.colorDarkBlueDoctorH.withOpacity(0.3),
              Constants.colorDarkBlueDoctorH.withOpacity(0.2),
              Constants.colorDarkBlueDoctorH.withOpacity(0.05),
              Constants.colorDarkBlueDoctorH.withOpacity(0.0),
            ],
            stops: const [
              0.1,
              0.2,
              0.3,
              0.4,
              0.5,
              0.6,
              0.7,
              0.8,
              0.9,
              0.94,
              0.96,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Covid-19 Healthcare",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Constants.colorWhiteLessSmoke,
                  fontWeight: FontWeight.w700,
                ),
          ),
          CustomSpace.vertical(),
          Text(
            "Book your next online appointments",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Constants.colorWhiteLessSmoke,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              Assets.imageHomeCovidDoctors,
              height: 252,
            ),
          ),
        ],
      ),
    );
  }
}
