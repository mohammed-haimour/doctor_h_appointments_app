import 'package:doctor_h_appointments_app/generated/assets.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
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
            Text(
              "Find Doctors",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            CustomSpace.vertical(space: 10),
            const DoctorsCardsListViewBuilder(),
          ],
        ));
  }
}

class DoctorsCardsListViewBuilder extends StatelessWidget {
  const DoctorsCardsListViewBuilder({super.key});

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
          return const DoctorCard();
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.paddingBiggerThanMedium,
      height: 180,
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
                      Image.asset(
                        Assets.imageHomeDoctor101,
                        width: 42,
                      ),
                      CustomSpace.horizontal(space: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sara James",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                          Text("Pediatrician | Mercy Hospital",
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text("4.5"),
                  CustomSpace.horizontal(space: 2),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Color.fromARGB(255, 196, 176, 0), // Border color
                        size: 28,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Constants.colorStartGolden, // Inner fill color
                        size: 24,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  CustomSpace.horizontal(space: 4),
                  const Text("10:30am - 5:30pm"),
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
