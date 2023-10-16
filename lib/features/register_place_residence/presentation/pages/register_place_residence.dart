// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/register_place_residence/presentation/cubit/register_place_residence_cubit.dart';

class RegisterPlaceResidence extends BasePage<RegisterPlaceResidenceState, RegisterPlaceResidenceCubit> {
  const RegisterPlaceResidence({super.key});

  @override
  RegisterPlaceResidenceCubit createBloc(BuildContext context) =>
      sl<RegisterPlaceResidenceCubit>()..init(context);

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
                SizedBox(height: context.sizeHeight() * 0.1),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    child: Text(
                      "WHERE IS YOUR PLACE OF RESIDENCE",
                      style: CafeKit.util.cafeTextStyle.title,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromRight,
                    child: Text(
                      "Hey complete the\ninformation to create a\naccount",
                      style: CafeKit.util.cafeTextStyle.text,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.05),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    startNow: state.activeFirstTime,
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 700),
                    child: CafeKit.widget.form.input(label: "Country"),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    startNow: state.activeFirstTime,
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 700),
                    child: CafeKit.widget.form.input(label: "State"),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    startNow: state.activeSecondTime,
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 700),
                    child: CafeKit.widget.form.input(label: "City"),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    startNow: state.activeSecondTime,
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 700),
                    child: CafeKit.widget.form.input(label: "Address"),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.05),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    startNow: state.activeThirdTime,
                    fromAnimation: FromAnimation.fromRight,
                    duration: const Duration(milliseconds: 700),
                    child: CafeKit.widget.button.formButton(
                      ButtonModel(label: "Create address", onTap: () {}),
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
