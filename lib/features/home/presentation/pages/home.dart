// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/home/presentation/cubit/home_cubit.dart';
import 'package:cafe_sabor/features/home/presentation/widget/carousel_products_widget.dart';
import 'package:cafe_sabor/features/home/presentation/widget/animated_description_widget.dart';

class Home extends BasePage<HomeState, HomeCubit> {
  const Home({super.key});

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SizedBox(
        width: context.sizeWidth(),
        height: context.sizeHeight(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselProductWidget(
                products: state.products,
                controller: state.controller,
              ),
              SizedBox(height: context.sizeHeight() * 0.02),
              AnimatedDescriptionWidget(
                pageController: state.controller,
                handledReturnController: (controller, index) {
                  controller.forward();
                  bloc.handledChangeProductIndex(index);
                },
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sizeWidth() * 0.1,
                  ),
                  child: Text(
                    state.products[state.productIndex].description,
                    textAlign: TextAlign.center,
                    style: CafeKit.util.cafeTextStyle.text,
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CafeKit.widget.button.formButton(
                  ButtonModel(label: "Suscribe", onTap: () {}),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
