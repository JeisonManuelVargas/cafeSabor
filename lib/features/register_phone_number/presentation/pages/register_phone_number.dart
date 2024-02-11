// ignore_for_file: depend_on_referenced_packages
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/register_phone_number/presentation/cubit/register_phone_number_cubit.dart';

class RegisterPhoneNumber
    extends BasePage<RegisterPhoneNumberState, RegisterPhoneNumberCubit> {
  final UserModel userModel;

  const RegisterPhoneNumber({super.key, required this.userModel});

  @override
  RegisterPhoneNumberCubit createBloc(BuildContext context) =>
      sl<RegisterPhoneNumberCubit>()..init(context, userModel);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: context.sizeWidth(),
          height: context.sizeHeight(),
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.sizeHeight() * 0.10),
                  CafeKit.widget.animate.animateContainer(
                    fromAnimationModel: FromAnimationModel(
                      duration: const Duration(milliseconds: 700),
                      fromAnimation: FromAnimation.fromRight,
                      child: Text(
                        "YOUR PHONE NUMBER",
                        style: CafeKit.util.cafeTextStyle.title,
                      ),
                    ),
                  ),
                  SizedBox(height: context.sizeHeight() * 0.03),
                  CafeKit.widget.animate.animateContainer(
                    fromAnimationModel: FromAnimationModel(
                      duration: const Duration(milliseconds: 800),
                      fromAnimation: FromAnimation.fromRight,
                      child: Text(
                        "We send a message code to validate\nthis number. With this number phone\nyou can loging",
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
                        label: "Phone number",
                        controller: state.phone,
                      ),
                    ),
                  ),
                  SizedBox(height: context.sizeHeight() * 0.03),
                  CafeKit.widget.animate.animateContainer(
                    fromAnimationModel: FromAnimationModel(
                      duration: const Duration(milliseconds: 1000),
                      fromAnimation: FromAnimation.fromRight,
                      child: Text(
                        "if you dont recive the validation code in\nthis time, please reset the code",
                        style: CafeKit.util.cafeTextStyle.text,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CafeKit.widget.animate.animateContainer(
                    fromAnimationModel: FromAnimationModel(
                      fromAnimation: FromAnimation.fromRight,
                      duration: const Duration(milliseconds: 1100),
                      child: CafeKit.widget.button.formButton(
                        ButtonModel(
                          label: "Continue",
                          onTap: bloc.goToValidatePhoneNumber,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.sizeHeight() * 0.02),
                  CafeKit.widget.animate.animateContainer(
                    fromAnimationModel: FromAnimationModel(
                      fromAnimation: FromAnimation.fromRight,
                      duration: const Duration(milliseconds: 1200),
                      child: CafeKit.widget.button.formButton(
                        ButtonModel(
                          label: "Reset code",
                          type: ButtonType.light,
                          onTap: bloc.goToValidatePhoneNumber,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
