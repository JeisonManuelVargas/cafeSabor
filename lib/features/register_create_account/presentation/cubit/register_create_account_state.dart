part of 'register_create_account_cubit.dart';

class RegisterCreateAccountState {
  final bool activeFirstTime;
  final bool activeSecondTime;
  final bool activeThirdTime;

  const RegisterCreateAccountState({
    required this.activeFirstTime,
    required this.activeSecondTime,
    required this.activeThirdTime,
  });

  factory RegisterCreateAccountState.init() => const RegisterCreateAccountState(
        activeFirstTime: false,
        activeSecondTime: false,
        activeThirdTime: false,
      );

  RegisterCreateAccountState copyWith({
    bool? activeFirstTime,
    bool? activeSecondTime,
    bool? activeThirdTime,
  }) =>
      RegisterCreateAccountState(
        activeFirstTime: activeFirstTime ?? this.activeFirstTime,
        activeSecondTime: activeSecondTime ?? this.activeSecondTime,
        activeThirdTime: activeThirdTime ?? this.activeThirdTime,
      );
}
