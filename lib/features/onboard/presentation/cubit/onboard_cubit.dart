// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {

  OnboardCubit()  : super(OnboardState.init());

  init(BuildContext context) {}

  goToCreateAccount() => AppNavigator.push(Routes.CREATE_ACCOUNT);
}
