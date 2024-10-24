import 'package:doctor_h_appointments_app/presentation/registration/widgets/create_account_bloc_listener.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/state_management/user/create_account/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.paddingMedium,
      child: Form(
        key: context.read<CreateAccountCubit>().formKey,
        child: const CreateAccountBlocListener()
      ),
    );
  }
}
