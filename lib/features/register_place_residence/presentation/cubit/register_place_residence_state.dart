part of 'register_place_residence_cubit.dart';

class RegisterPlaceResidenceState {
  final UserModel userModel;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController addressController;

  const RegisterPlaceResidenceState({
    required this.userModel,
    required this.cityController,
    required this.stateController,
    required this.countryController,
    required this.addressController,
  });

  factory RegisterPlaceResidenceState.init() => RegisterPlaceResidenceState(
        userModel: UserModel.init(),
        cityController: TextEditingController(),
        stateController: TextEditingController(),
        addressController: TextEditingController(),
        countryController: TextEditingController(),
      );

  RegisterPlaceResidenceState copyWith({
    UserModel? userModel,
  }) =>
      RegisterPlaceResidenceState(
        cityController: cityController,
        stateController: stateController,
        countryController: countryController,
        addressController: addressController,
        userModel: userModel ?? this.userModel,
      );
}
