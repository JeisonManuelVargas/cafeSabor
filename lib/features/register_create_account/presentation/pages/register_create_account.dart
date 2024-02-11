// ignore_for_file: depend_on_referenced_packages
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/register_create_account/presentation/cubit/register_create_account_cubit.dart';

class RegisterCreateAccount
    extends BasePage<RegisterCreateAccountState, RegisterCreateAccountCubit> {

  final UserModel userModel;

  const RegisterCreateAccount({super.key, required this.userModel});

  @override
  RegisterCreateAccountCubit createBloc(BuildContext context) =>
      sl<RegisterCreateAccountCubit>()..init(context, userModel);

  /*390 * 844*/
  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: context.sizeWidth(),
          height: context.sizeHeight(),
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.sizeHeight() * 0.15),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 700),
                    child: Text(
                      "CREATE A NEW ACCOUNT",
                      style: CafeKit.util.cafeTextStyle.title,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      "Hey complete the\ninformation to create a\naccount",
                      style: CafeKit.util.cafeTextStyle.text,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.05),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 900),
                    child: CafeKit.widget.form.input(
                      label: "Name",
                      controller: state.nameController,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 1000),
                    child: CafeKit.widget.form.input(
                      label: "Last name",
                      controller: state.lastNameController,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 1100),
                    child: CafeKit.widget.form.input(
                      label: "Email",
                      controller: state.emailController,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 1200),
                    child: CafeKit.widget.form.input(
                      label: "Password",
                      controller: state.passwordController,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.05),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 1300),
                    child: CafeKit.widget.button.formButton(
                      ButtonModel(
                          label: "Create account",
                          onTap: bloc.goToRegisterPlaceResidence),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
