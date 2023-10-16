// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_place_residence_state.dart';

class RegisterPlaceResidenceCubit extends Cubit<RegisterPlaceResidenceState> {

  RegisterPlaceResidenceCubit()  : super(RegisterPlaceResidenceState.init());

  init(BuildContext context) {}

  goToCreatePhone () => AppNavigator.push(Routes.REGISTER_PHONE_NUMBER);


}
