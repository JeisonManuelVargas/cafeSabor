part of 'register_place_residence_cubit.dart';

class RegisterPlaceResidenceState {
  final bool activeFirstTime;
  final bool activeSecondTime;
  final bool activeThirdTime;

  const RegisterPlaceResidenceState({
    required this.activeFirstTime,
    required this.activeSecondTime,
    required this.activeThirdTime,
  });

  factory RegisterPlaceResidenceState.init() => const RegisterPlaceResidenceState(
        activeFirstTime: false,
        activeSecondTime: false,
        activeThirdTime: false,
      );

  RegisterPlaceResidenceState copyWith({
    bool? activeFirstTime,
    bool? activeSecondTime,
    bool? activeThirdTime,
  }) =>
      RegisterPlaceResidenceState(
        activeFirstTime: activeFirstTime ?? this.activeFirstTime,
        activeSecondTime: activeSecondTime ?? this.activeSecondTime,
        activeThirdTime: activeThirdTime ?? this.activeThirdTime,
      );
}
