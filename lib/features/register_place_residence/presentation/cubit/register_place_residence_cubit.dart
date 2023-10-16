// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_place_residence_state.dart';

class RegisterPlaceResidenceCubit extends Cubit<RegisterPlaceResidenceState> {

  RegisterPlaceResidenceCubit()  : super(RegisterPlaceResidenceState.init());

  init(BuildContext context) {
   Future.delayed(const Duration(milliseconds: 150), ()=> emit(state.copyWith(activeFirstTime: true)));
   Future.delayed(const Duration(milliseconds: 250), ()=> emit(state.copyWith(activeSecondTime: true)));
   Future.delayed(const Duration(milliseconds: 400), ()=> emit(state.copyWith(activeThirdTime: true)));
  }


}
