import 'package:doctor_h_appointments_app/presentation/registration/enums/registration_type_enum.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/create_account_form.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/registration_footer.dart';
import 'package:doctor_h_appointments_app/presentation/registration/widgets/registration_header.dart';
import 'package:doctor_h_appointments_app/shared/local/secure_storage_factory.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_button.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_screen_wrapper.dart';
import 'package:doctor_h_appointments_app/state_management/user/get_save_user_information/get_save_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  void initState() {
    context.read<GetSaveUserInformationCubit>().selectYourTheme(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreenWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const RegistrationHeader(),
            const CreateAccountForm(),
            CustomButton(
                text: "delete akk",
                onPressed: () async {
                  await SecureStorageFactory.getStorage().deleteAll();
                }),
            const RegistrationFooter(
              registrationType: RegistrationTypeEnum.createAccount,
            ),
          ],
        ),
      ),
    );
  }
}
