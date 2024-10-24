import 'package:doctor_h_appointments_app/presentation/registration/widgets/log_in_bloc_listener.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';

import 'package:doctor_h_appointments_app/state_management/user/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingMedium,
      child: Form(
        key: context.read<LogInCubit>().formKey,
        child: const LogInBlocListener()
      ),
    );
  }
}
