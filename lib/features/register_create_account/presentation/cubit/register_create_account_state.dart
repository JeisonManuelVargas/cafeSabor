part of 'register_create_account_cubit.dart';

class RegisterCreateAccountState {
  final UserModel userModel;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;

  const RegisterCreateAccountState({
    required this.userModel,
    required this.emailController,
    required this.nameController,
    required this.lastNameController,
    required this.passwordController,
  });

  factory RegisterCreateAccountState.init() => RegisterCreateAccountState(
        userModel: UserModel.init(),
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        lastNameController: TextEditingController(),
      );

  RegisterCreateAccountState copyWith({
    UserModel? userModel,
  }) =>
      RegisterCreateAccountState(
        nameController: nameController,
        emailController: emailController,
        lastNameController: lastNameController,
        passwordController: passwordController,
        userModel: userModel ?? this.userModel,
      );
}
