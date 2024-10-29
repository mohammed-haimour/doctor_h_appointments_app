import 'package:doctor_h_appointments_app/business/user/user_business_interface.dart';
import 'package:doctor_h_appointments_app/shared/di/dependency_injection.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppThemeSwitch extends StatelessWidget {
  const CustomAppThemeSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSaveUserInformationCubit,
        GetSaveUserInformationState>(
      builder: (context, state) {
        return Padding(
          padding: Constants.paddingMedium,
          child: Row(
            children: [
              Expanded(
                  child: ThemeCard(
                isSelected:
                    getIt<UserBusinessInterface>().userInformation!.theme ==
                            ThemeMode.light
                        ? true
                        : false,
                text: "Light",
                icon: Icons.light_mode,
                onPressed: () {
                  context
                      .read<GetSaveUserInformationCubit>()
                      .saveUserInformation(
                          userInformationToSave: getIt<UserBusinessInterface>()
                              .userInformation!
                              .copyWith(theme: ThemeMode.light));
                },
              )),
              CustomSpace.horizontal(),
              Expanded(
                  child: ThemeCard(
                isSelected:
                    getIt<UserBusinessInterface>().userInformation!.theme ==
                            ThemeMode.dark
                        ? true
                        : false,
                text: "Dark",
                icon: Icons.dark_mode_sharp,
                onPressed: () {
                  context
                      .read<GetSaveUserInformationCubit>()
                      .saveUserInformation(
                          userInformationToSave: getIt<UserBusinessInterface>()
                              .userInformation!
                              .copyWith(theme: ThemeMode.dark));
                },
              )),
            ],
          ),
        );
      },
    );
  }
}

class ThemeCard extends StatelessWidget {
  final bool isSelected;
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  const ThemeCard(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(children: [
        Container(
          width: double.infinity,
          padding: Constants.paddingMedium,
          height: 120,
          decoration: BoxDecoration(
              color: Constants.colorWhiteBlueVeryLight,
              borderRadius: Constants.radiusMedium,
              border: Border.all(color: Constants.colorDarkBlueDoctorH)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: 50,
              ),
              CustomSpace.vertical(space: 10),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
        (isSelected)
            ? const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: Constants.colorGreen,
                  size: 30,
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
