part of 'validate_phone_number_cubit.dart';

class ValidatePhoneNumberState {
  final bool activeFirstTime;

  const ValidatePhoneNumberState({
    required this.activeFirstTime,
  });

  factory ValidatePhoneNumberState.init() => const ValidatePhoneNumberState(
        activeFirstTime: false,
      );

  ValidatePhoneNumberState copyWith({
    bool? activeFirstTime,
  }) =>
      ValidatePhoneNumberState(
        activeFirstTime: activeFirstTime ?? this.activeFirstTime,
      );
}
