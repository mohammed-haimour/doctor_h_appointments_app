import 'dart:math';
import 'package:intl/intl.dart';

import 'package:doctor_h_appointments_app/data/doctors/models/get_all_doctors/get_all_doctors_response_model.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class DoctorsCardsListViewBuilder extends StatelessWidget {
  final List<Doctor> doctors;
  const DoctorsCardsListViewBuilder({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingMedium,
      child: ListView.separated(
        itemCount: 4,
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
        color: Constants.colorWhiteBlueVeryLight,
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
                      ClipOval(
                        child: Image.network(
                          "",
                          width: 42,
                          height: 42,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person,
                                  size: 42, color: Colors.grey),
                        ),
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
