// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_place_residence_state.dart';

class RegisterPlaceResidenceCubit extends Cubit<RegisterPlaceResidenceState> {
  RegisterPlaceResidenceCubit() : super(RegisterPlaceResidenceState.init());

  init(BuildContext context, UserModel user) => emit(state.copyWith(userModel: user));

  goToCreatePhone() {
    final address = AddressModel(
      position: null,
      dateCreate: DateTime.now(),
      city: state.cityController.text,
      state: state.stateController.text,
      address: state.addressController.text,
      country: state.countryController.text,
    );
    state.userModel.address.add(address);

    AppNavigator.push(
      Routes.REGISTER_PHONE_NUMBER,
      arguments: state.userModel,
    );
  }

  @override
  Future<void> close() {
    state.cityController.clear();
    state.stateController.clear();
    state.countryController.clear();
    state.addressController.clear();
    return super.close();
  }
}
