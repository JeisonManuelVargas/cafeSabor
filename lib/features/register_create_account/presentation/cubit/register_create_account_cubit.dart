// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_create_account_state.dart';

class RegisterCreateAccountCubit extends Cubit<RegisterCreateAccountState> {
  RegisterCreateAccountCubit() : super(RegisterCreateAccountState.init());

  init(BuildContext context, UserModel user) =>
      emit(state.copyWith(userModel: user));

  goToRegisterPlaceResidence() {
    final user = state.userModel.copyWith(
      name: state.nameController.text,
      email: state.emailController.text,
      lastName: state.lastNameController.text,
      password: state.passwordController.text,
    );

    AppNavigator.push(Routes.REGISTER_PLACE_RESIDENCE, arguments: user);
  }

  @override
  Future<void> close() {
    state.nameController.clear();
    state.emailController.clear();
    state.lastNameController.clear();
    state.passwordController.clear();
    return super.close();
  }
}
