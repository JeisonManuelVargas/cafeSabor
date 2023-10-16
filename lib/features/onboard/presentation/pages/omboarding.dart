// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/onboard/presentation/cubit/onboard_cubit.dart';
import 'package:cafe_sabor/features/onboard/presentation/widget/position_image_widget.dart';
import 'package:cafe_sabor/features/onboard/presentation/widget/colombian_coffee_widget.dart';

class Onboard extends BasePage<OnboardState, OnboardCubit> {
  const Onboard({super.key});

  @override
  OnboardCubit createBloc(BuildContext context) =>
      sl<OnboardCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.sizeWidth(),
          height: context.sizeHeight(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: context.sizeHeight() * 0.08,
                  left: -30,
                  child: CafeKit.widget.animate.animateContainer(
                    fromAnimationModel: FromAnimationModel(
                      fromAnimation: FromAnimation.fromLeft,
                      child: const ColombianCoffeeWidget(),
                    ),
                  ),
                ),
                PositionImageWidget(
                  right: -10,
                  angle: 5.7,
                  top: context.sizeHeight() * 0.15,
                  width: context.sizeWidth() * 0.1,
                  height: context.sizeHeight() * 0.1,
                  image: "assets/image/cafeBean.png",
                  fromAnimation: FromAnimation.fromRight,
                ),
                PositionImageWidget(
                  right: 10,
                  angle: 5.2,
                  top: context.sizeHeight() * 0.18,
                  width: context.sizeWidth() * 0.05,
                  height: context.sizeHeight() * 0.1,
                  image: "assets/image/cafeBean.png",
                  fromAnimation: FromAnimation.fromRight,
                ),
                CafeKit.widget.animate.animateContainer(
                  fromAnimationModel: FromAnimationModel(
                    fromAnimation: FromAnimation.fromDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.sizeHeight() * 0.28),
                          Container(
                            height: context.sizeHeight() * 0.3,
                            width: context.sizeWidth() * 0.77,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/image/cafeSabor.png"),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: CafeKit.util.color.textColor,
                          ),
                          Text(
                            "Discover the exquisite experience of coffee, your ultimate delight guaranteed.",
                            style: CafeKit.util.cafeTextStyle.text,
                          ),
                          SizedBox(height: context.sizeHeight() * 0.2),
                          CafeKit.widget.button.formButton(
                            ButtonModel(
                              label: "Start experience",
                              onTap: bloc.goToCreateAccount,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                PositionImageWidget(
                  top: context.sizeHeight() * 0.28,
                  width: context.sizeWidth() * 0.27,
                  image: "assets/image/colibri.png",
                  height: context.sizeHeight() * 0.27,
                  fromAnimation: FromAnimation.fromLeft,
                ),
                PositionImageWidget(
                  right: -25,
                  angle: 5.7,
                  top: context.sizeHeight() * 0.6,
                  image: "assets/image/plant.png",
                  width: context.sizeWidth() * 0.4,
                  height: context.sizeHeight() * 0.4,
                  fromAnimation: FromAnimation.fromRight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
