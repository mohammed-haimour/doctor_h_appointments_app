import 'package:doctor_h_appointments_app/presentation/registration/enums/registration_type_enum.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/create_account_form.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/registration_footer.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/registration_header.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScreenWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RegistrationHeader(),
            CreateAccountForm(),
            RegistrationFooter(registrationType: RegistrationTypeEnum.createAccount,),
          ],
        ),
      ),
    );
  }
}
