import 'package:doctor_h_appointments_app/business/doctors/doctors_business_interface.dart';
import 'package:doctor_h_appointments_app/business/doctors/entities/get_all_doctors_result_entity.dart';
import 'package:doctor_h_appointments_app/shared/networking/errors/api_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  final DoctorsBusinessInterface _doctorsBusiness;
  GetAllDoctorsCubit(this._doctorsBusiness) : super(GetAllDoctorsInitial());

  Future<void> getAllDoctors() async {
    emit(GetAllDoctorsLoading());

    var result = await _doctorsBusiness.getAllDoctors();

    void ifFailure(Failure failure)=>emit(GetAllDoctorsFailure(message: failure.message));
    void ifSuccess(GetAllDoctorsResultEntity entity)=>emit(GetAllDoctorsSuccess(getAllDoctorsResultEntity: entity));

    result.fold(
      ifFailure,
      ifSuccess
    );
  }
}
