import 'package:doctor_h_appointments_app/presentation/home/widgets/doctors_cards_list_view.dart';
import 'package:doctor_h_appointments_app/shared/variables/constants.dart';
import 'package:doctor_h_appointments_app/shared/widgets/custom_error_widget.dart';
import 'package:doctor_h_appointments_app/state_management/doctors/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FindDoctorsBlocBuilder extends StatelessWidget {
  const FindDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
      builder: (context, state) {
        if (state is GetAllDoctorsSuccess) {
          return DoctorsCardsListViewBuilder(
              doctors: state.getAllDoctorsReponseModel.data);
        } else if (state is GetAllDoctorsFailure) {
          return CustomErrorWidget(errorMessage: state.message);
        } else if (state is GetAllDoctorsLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: Constants.paddingBiggerThanMedium,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: Constants.radiusLarge,
                color: Constants.colorDoctorHRed,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
