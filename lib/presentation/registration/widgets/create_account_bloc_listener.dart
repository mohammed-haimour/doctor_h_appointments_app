import 'package:doctor_h_appointments_app/shared/extensions/navigation.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_error_dialog.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_loading_dialog.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_obscurable_form_field.dart.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
import 'package:doctor_h_appointments_app/state_management/user/create_account/create_account_cubit.dart';
import 'package:doctor_h_appointments_app/state_management/user/create_account/create_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountBlocListener extends StatefulWidget {
  const CreateAccountBlocListener({super.key});

  @override
  State<CreateAccountBlocListener> createState() =>
      _CreateAccountBlocListenerState();
}

class _CreateAccountBlocListenerState extends State<CreateAccountBlocListener> {
  late final TextEditingController _emailFieldController;
  late final TextEditingController _passwordFieldController;
  late final TextEditingController _nameFieldController;
  late final TextEditingController _phoneFieldController;

  @override
  void initState() {
    _emailFieldController =
        context.read<CreateAccountCubit>().emailFieldController;
    _passwordFieldController =
        context.read<CreateAccountCubit>().passwordFieldController;
    _nameFieldController =
        context.read<CreateAccountCubit>().nameFieldController;
    _phoneFieldController =
        context.read<CreateAccountCubit>().phoneNumberFieldController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        if(state is CreateAccountSuccess){
          // to pop the loading dialog :)
          context.pop();
          context.pushReplacementNamed(Routes.homeScreen);
        }else if(state is CreateAccountFailure){
          context.pop();
          customErrorDialog(context, errorMessage: state.message);
        }else if(state is CreateAccountLoading){
          customLoadingDialog(context);
        }
      },
      child: Column(
        children: [
          Column(
            children: [
              Text("Create Account",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600)),
              CustomSpace.vertical(space: 5),
              Text("We are here to help you!",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w200))
            ],
          ),
          CustomSpace.vertical(space: 40),
          CustomTextFormField(
            hintText: "Name",
            prefixIcon: Icons.person,
            validator: context.read<CreateAccountCubit>().nameValidation,
            controller: _nameFieldController,
          ),
          CustomSpace.vertical(),
          CustomTextFormField(
              hintText: "Phone Number",
              prefixIcon: Icons.phone,
              validator:
                  context.read<CreateAccountCubit>().phoneNumberValidation,
              controller: _phoneFieldController),
          CustomSpace.vertical(),
          CustomTextFormField(
              hintText: "Email",
              prefixIcon: Icons.mail_rounded,
              validator: context.read<CreateAccountCubit>().emailValidation,
              controller: _emailFieldController),
          CustomSpace.vertical(),
          CustomObscurableFormField(
              hintText: "Password",
              prefixIcon: Icons.password,
              validator: context.read<CreateAccountCubit>().passwordValidation,
              controller: _passwordFieldController),
          CustomSpace.vertical(),
          CustomButton(
              text: "Create Account",
              onPressed: context.read<CreateAccountCubit>().createAccount,
              isFullWidth: true)
        ],
      ),
    );
  }
}
