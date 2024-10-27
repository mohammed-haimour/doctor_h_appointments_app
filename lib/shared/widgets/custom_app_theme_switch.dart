import 'package:doctor_h_appointments_app/data/user/models/user_information/user_information_model.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppThemeSwitch extends StatefulWidget {
  const CustomAppThemeSwitch({super.key});

  @override
  State<CustomAppThemeSwitch> createState() => _CustomAppThemeSwitchState();
}

class _CustomAppThemeSwitchState extends State<CustomAppThemeSwitch> {
  // i like to do it in this way because i will write less code LOL ,, i know the reaability is trash but
  // it s just a simple widget LOL :) :)
  final UserInformationModel userToSave = UserInformationModel(
      email: null, password: null, theme: "light", isQuickAccess: null);

  @override
  void initState() {
    context
        .read<GetSaveUserInformationCubit>()
        .saveUserInformation(userInformationToSave: userToSave);
    super.initState();
  }

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
                isSelected: userToSave.theme == "light" ? true : false,
                text: "Light",
                icon: Icons.light_mode,
                onPressed: () {
                  if (userToSave.theme != "light") {
                    userToSave.copyWith(theme: "light");
                    context
                        .read<GetSaveUserInformationCubit>()
                        .saveUserInformation(userInformationToSave: userToSave);
                  }
                },
              )),
              CustomSpace.horizontal(),
              Expanded(
                  child: ThemeCard(
                isSelected: userToSave.theme == "dark" ? true : false,
                text: "Dark",
                icon: Icons.dark_mode_sharp,
                onPressed: () {
                  if (userToSave.theme != "dark") {
                    userToSave.copyWith(theme: "dark");
                    context
                        .read<GetSaveUserInformationCubit>()
                        .saveUserInformation(userInformationToSave: userToSave);
                  }
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
