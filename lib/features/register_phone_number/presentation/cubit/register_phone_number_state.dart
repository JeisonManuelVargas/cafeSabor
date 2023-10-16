part of 'register_phone_number_cubit.dart';

class RegisterPhoneNumberState {
  final bool activeFirstTime;

  const RegisterPhoneNumberState({
    required this.activeFirstTime,
  });

  factory RegisterPhoneNumberState.init() => const RegisterPhoneNumberState(
        activeFirstTime: false,
      );

  RegisterPhoneNumberState copyWith({
    bool? activeFirstTime,
  }) =>
      RegisterPhoneNumberState(
        activeFirstTime: activeFirstTime ?? this.activeFirstTime,
      );
}
