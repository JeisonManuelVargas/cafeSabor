// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_phone_number_state.dart';

class RegisterPhoneNumberCubit extends Cubit<RegisterPhoneNumberState> {

  RegisterPhoneNumberCubit()  : super(RegisterPhoneNumberState.init());

  init(BuildContext context, UserModel user) => emit(state.copyWith(userModel: user));

  goToValidatePhoneNumber() {
    AppNavigator.push(Routes.VALIDATE_PHONE_NUMBER, arguments: state.userModel.copyWith(
      phone: state.phone.text
    ));
  }


}
