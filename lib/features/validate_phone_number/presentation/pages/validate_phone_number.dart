// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/validate_phone_number/presentation/cubit/validate_phone_number_cubit.dart';

class ValidatePhoneNumber
    extends BasePage<ValidatePhoneNumberState, ValidatePhoneNumberCubit> {
  const ValidatePhoneNumber({super.key});

  @override
  ValidatePhoneNumberCubit createBloc(BuildContext context) =>
      sl<ValidatePhoneNumberCubit>()..init(context);

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: context.sizeHeight() * 0.17),
              CafeKit.widget.animate.animateContainer(
                fromAnimationModel: FromAnimationModel(
                  duration: const Duration(milliseconds: 700),
                  fromAnimation: FromAnimation.fromRight,
                  child: Text(
                    "VALIDATE\nPHONE",
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
                    "Verificate your code",
                    style: CafeKit.util.cafeTextStyle.text,
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.12),
              CafeKit.widget.animate.animateContainer(
                fromAnimationModel: FromAnimationModel(
                  fromAnimation: FromAnimation.fromRight,
                  duration: const Duration(milliseconds: 900),
                  child: CafeKit.widget.form.inputValidateCode(
                    amountIndex: 3,
                    callBack: (){},
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.18),
              CafeKit.widget.animate.animateContainer(
                fromAnimationModel: FromAnimationModel(
                  fromAnimation: FromAnimation.fromRight,
                  duration: const Duration(milliseconds: 1100),
                  child: CafeKit.widget.button.formButton(
                    ButtonModel(
                      label: "Continue",
                      onTap: bloc.goToHome,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
