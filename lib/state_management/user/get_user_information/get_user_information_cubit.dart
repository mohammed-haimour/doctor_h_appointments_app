import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_user_information_state.dart';

class GetUserInformationCubit extends Cubit<GetUserInformationState> {
  GetUserInformationCubit() : super(GetUserInformationInitial());
}
