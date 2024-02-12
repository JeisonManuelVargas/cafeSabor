// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:cafe_sabor/core/util/custom_snack_bar.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/use_case/create_data_user_use_case.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/use_case/register_with_email_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'validate_phone_number_state.dart';

class ValidatePhoneNumberCubit extends Cubit<ValidatePhoneNumberState> {
  final CreateDataUserUseCase _createDataUserUseCase;
  final RegisterWithEmailPasswordUseCase _registerWithEmailPasswordUseCase;

  ValidatePhoneNumberCubit({
    required CreateDataUserUseCase createDataUserUseCase,
    required RegisterWithEmailPasswordUseCase registerWithEmailPasswordUseCase,
  })  : _createDataUserUseCase = createDataUserUseCase,
        _registerWithEmailPasswordUseCase = registerWithEmailPasswordUseCase,
        super(ValidatePhoneNumberState.init());

  init(BuildContext context, UserModel user) =>
      emit(state.copyWith(userModel: user));

  saveUser(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerWithEmailPasswordUseCase(
      RegisterWithEmailPasswordParams(
        email: state.userModel.email,
        password: state.userModel.password,
      ),
    );
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (String r) async => _saveUserData(context),
    );

    emit(state.copyWith(isLoading: false));
  }

  _saveUserData(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createDataUserUseCase(state.userModel);
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (UserModel r) async => _goToHome(r),
    );
    emit(state.copyWith(isLoading: false));
  }

  _goToHome(UserModel user) => AppNavigator.pushNamedAndRemoveUntil(Routes.HOME);
}
