part of 'register_phone_number_cubit.dart';

class RegisterPhoneNumberState {
  final UserModel userModel;
  final TextEditingController phone;

  const RegisterPhoneNumberState({
    required this.userModel,
    required this.phone,
  });

  factory RegisterPhoneNumberState.init() => RegisterPhoneNumberState(
        userModel: UserModel.init(),
        phone: TextEditingController(),
      );

  RegisterPhoneNumberState copyWith({
    UserModel? userModel,
  }) =>
      RegisterPhoneNumberState(
        phone: phone,
        userModel: userModel ?? this.userModel,
      );
}
