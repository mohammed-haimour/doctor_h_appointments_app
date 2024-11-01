import 'package:doctor_h_appointments_app/presentation/settings/widgets/personal_details_to_show_and_update.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_error_widget.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_loading_widget.dart';
import 'package:doctor_h_appointments_app/state_management/user/user_informations/get_user_informations/get_user_informations_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPersonalDetailsSectionBlocBuilder extends StatelessWidget {
  const EditPersonalDetailsSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInformationsCubit, GetUserInformationsState>(
      builder: (context, state) {
        if (state is GetUserInformationsSuccess) {
          return PersonalDetailsToShowAndUpdate(userInformations: state.userInformations);
        } else if (state is GetUserInformationsFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
