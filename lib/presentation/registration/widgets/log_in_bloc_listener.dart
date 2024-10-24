import 'package:doctor_h_appointments_app/shared/extensions/navigation.dart';
import 'package:doctor_h_appointments_app/shared/routing/routes.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_error_dialog.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_loading_dialog.dart';
import 'package:doctor_h_appointments_app/state_management/user/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_obscurable_form_field.dart.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_space.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInBlocListener extends StatefulWidget {
  const LogInBlocListener({super.key});

  @override
  State<LogInBlocListener> createState() => _LogInBlocListenerState();
}

class _LogInBlocListenerState extends State<LogInBlocListener> {

  late final TextEditingController _emailFieldController;
  late final TextEditingController _passwordFieldController;

  @override
  void initState() {
    _emailFieldController = context.read<LogInCubit>().emailFieldController;
    _passwordFieldController = context.read<LogInCubit>().passwordFieldController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess){
          // to pop the loading dialog :)
          context.pop();
          context.pushReplacementNamed(Routes.homeScreen);
        }else if(state is LoginFailure){
          context.pop();
          customErrorDialog(context, errorMessage: state.message);
        }else if(state is LoginLoading){
          customLoadingDialog(context);
        }
      },
      child: Column(
        children: [
          Column(
            children: [
              Text("Log In To Your Account" , style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)),
              CustomSpace.vertical(space: 5),
              Text("Welcome Back !" , style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w200))
            ],
          ),
          CustomSpace.vertical(space: 40),
          CustomTextFormField(hintText: "Email",prefixIcon: Icons.mail_rounded ,validator: context.read<LogInCubit>().emailValidation ,controller: _emailFieldController,),
          CustomSpace.vertical(),
          CustomObscurableFormField(hintText: "Password", prefixIcon: Icons.password, validator: context.read<LogInCubit>().passwordValidation ,controller: _passwordFieldController,),
          CustomSpace.vertical(),
          CustomButton(text: "Log In", onPressed: context.read<LogInCubit>().login, isFullWidth : true)
      ],
    ),
);
  }
}
