// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_create_account_state.dart';

class RegisterCreateAccountCubit extends Cubit<RegisterCreateAccountState> {

  RegisterCreateAccountCubit()  : super(RegisterCreateAccountState.init());

  init(BuildContext context) {
   Future.delayed(const Duration(milliseconds: 150), ()=> emit(state.copyWith(activeFirstTime: true)));
   Future.delayed(const Duration(milliseconds: 250), ()=> emit(state.copyWith(activeSecondTime: true)));
   Future.delayed(const Duration(milliseconds: 400), ()=> emit(state.copyWith(activeThirdTime: true)));
  }

  goToRegisterPlaceResidence()=> AppNavigator.push(Routes.REGISTER_PLACE_RESIDENCE);


}
