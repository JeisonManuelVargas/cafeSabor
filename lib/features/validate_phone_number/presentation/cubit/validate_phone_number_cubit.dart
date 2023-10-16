// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'validate_phone_number_state.dart';

class ValidatePhoneNumberCubit extends Cubit<ValidatePhoneNumberState> {

  ValidatePhoneNumberCubit()  : super(ValidatePhoneNumberState.init());

  init(BuildContext context) {}

  goToHome()=> AppNavigator.push(Routes.HOME);


}
