part of 'validate_phone_number_cubit.dart';

class ValidatePhoneNumberState {
  final bool isLoading;
  final UserModel userModel;

  const ValidatePhoneNumberState({
    required this.isLoading,
    required this.userModel,
  });

  factory ValidatePhoneNumberState.init() => ValidatePhoneNumberState(
        isLoading: false,
        userModel: UserModel.init(),
      );

  ValidatePhoneNumberState copyWith({
    bool? isLoading,
    UserModel? userModel,
  }) =>
      ValidatePhoneNumberState(
        userModel: userModel ?? this.userModel,
        isLoading: isLoading ?? this.isLoading,
      );
}
