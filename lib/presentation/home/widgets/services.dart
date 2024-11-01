import 'package:doctor_h_appointments_app/shared/extensions/navigation_extenstions.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          CustomSpace.vertical(space: 10),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            children: [
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.doctorsScreen);
                },
                child: Container(
                  padding: Constants.paddingSmall,
                  decoration: BoxDecoration(
                      color: Constants.colorTransparentDarkBlueDoctorH,
                      borderRadius: Constants.radiusLarge),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Icon(
                            Icons.people,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Find Doctors",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.bookAnAppointment);
                },
                child: Container(
                  padding: Constants.paddingSmall,
                  decoration: BoxDecoration(
                      color: Constants.colorTransparentDarkBlueDoctorH,
                      borderRadius: Constants.radiusLarge),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Book an appointment",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.specializations);
                },
                child: Container(
                  padding: Constants.paddingSmall,
                  decoration: BoxDecoration(
                      color: Constants.colorTransparentDarkBlueDoctorH,
                      borderRadius: Constants.radiusLarge),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Icon(
                            Icons.style,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Find Doctors By Specilaizatoin",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.settings);
                },
                child: Container(
                  padding: Constants.paddingSmall,
                  decoration: BoxDecoration(
                      color: Constants.colorTransparentDarkBlueDoctorH,
                      borderRadius: Constants.radiusLarge),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Icon(
                            Icons.settings,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Settings",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
