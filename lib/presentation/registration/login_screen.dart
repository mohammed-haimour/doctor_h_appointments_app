import 'package:doctor_h_appointments_app/presentation/registration/enums/registration_type_enum.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/log_in_form.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/registration_footer.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/registration_header.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_preferences/get_save_user_preferences_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    context.read<GetSaveUserPreferencesCubit>().autoLogIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScreenWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RegistrationHeader(),
            LogInForm(),
            RegistrationFooter(registrationType: RegistrationTypeEnum.logIn),
          ],
        ),
      ),
    );
  }
}
