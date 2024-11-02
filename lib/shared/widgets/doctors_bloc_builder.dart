import 'dart:math';

import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_error_widget.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/state_management/doctors/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
      builder: (context, state) {
        if (state is GetAllDoctorsSuccess) {
          return DoctorsCardsListViewBuilder(
              doctors: state.getAllDoctorsReponseModel.data);
        } else if (state is GetAllDoctorsFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else if (state is GetAllDoctorsLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: Constants.paddingBiggerThanMedium,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: Constants.radiusLarge,
                color: Constants.colorDoctorHRed,
              ),
            ),
          );
        } else {
          return const Text("hello ");
        }
      },
    );
  }
}

class DoctorsCardsListViewBuilder extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsCardsListViewBuilder({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingMedium,
      child: ListView.separated(
        itemCount: doctors.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return CustomSpace.vertical(space: 16);
        },
        itemBuilder: (context, index) {
          return DoctorCard(
            // image: "https://thispersondoesnotexist.com",
            doctor: doctors[index],
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.paddingBiggerThanMedium,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: Constants.radiusLarge,
        color: getIt<UserBusinessInterface>().userPreferences!.theme! ==
                ThemeMode.light
            ? Constants.colorWhiteBlueVeryLight
            : Constants.colorLightBlack,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ClipOval(
                        child: Icon(Icons.person, size: 42, color: Colors.grey),
                      ),
                      CustomSpace.horizontal(space: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(doctor.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                          Text(doctor.specialization.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Constants.colorGrey))
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Constants.colorRed,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Color.fromARGB(255, 196, 176, 0),
                        size: 24,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Constants.colorStartGolden,
                        size: 20,
                      ),
                    ],
                  ),
                  CustomSpace.horizontal(space: 2),
                  Text(
                      (3.5 + (Random().nextDouble() * 1.5)).toStringAsFixed(1)),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: Color.fromARGB(220, 74, 100, 130),
                  ),
                  CustomSpace.horizontal(space: 4),
                  Text(
                      "${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(doctor.startTime))} - ${DateFormat.jm().format(DateFormat("HH:mm:ss").parse(doctor.endTime))}"),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.attach_money,
                    color: Constants.colorDarkGreen,
                    size: 20,
                  ),
                  Text((doctor.appointPrice - (Random().nextInt(80) + 1))
                      .toString()),
                ],
              )
            ],
          ),
          CustomButton(
            text: "Book Appointment",
            backGroundColor: Constants.colorDarkBlueDoctorH,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
