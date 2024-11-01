import 'package:doctor_h_appointments_app/shared/extensions/navigation_extenstions.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_error_dialog.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_loading_dialog.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/state_management/user/logout/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutSectionInAccountSettings extends StatelessWidget {
  const LogoutSectionInAccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          customLoadingDialog(context);
        } else if (state is LogoutSuccess) {
          context.pop();
          context.pushReplacementNamed(Routes.logInScreen);
        } else if (state is LogoutFailure) {
          customErrorDialog(context, errorMessage: state.message);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sign Out :"),
            CustomSpace.vertical(space: 10),
            CustomButton(
              text: "Sign Out !",
              onPressed: () {
                context.read<LogoutCubit>().logout();
              },
              backGroundColor: Constants.colorDoctorHRed,
            ),
            CustomSpace.vertical(),
          ],
        );
      },
    );
  }
}
