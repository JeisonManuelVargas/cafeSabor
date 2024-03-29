// ignore_for_file: depend_on_referenced_packages
import 'package:cafe_sabor/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/util/custom_loading_widget.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/home/presentation/cubit/home_cubit.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';
import 'package:cafe_sabor/features/home/presentation/widget/carousel_products_widget.dart';
import 'package:cafe_sabor/features/home/presentation/widget/animated_description_widget.dart';

class Home extends BasePage<HomeState, HomeCubit> {
  const Home({super.key});

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      body: SizedBox(
        width: context.sizeWidth(),
        height: context.sizeHeight(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselProductWidget(
                    products: state.products,
                    controller: state.controller,
                    onTapProduct: bloc.goToDetailProduct,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.sizeHeight() * 0.09),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 33),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomLoadingWidget(
                                isLoading: state.isLoading,
                                child: Text(
                                  "${state.user.name.getFirstItem()} IT'S\nCOFFEE TIME"
                                      .toUpperCase(),
                                  style: CafeKit.util.cafeTextStyle.titleL,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Builder(builder: (context) {
                              return InkWell(
                                onTap: () =>
                                    Scaffold.of(context).openEndDrawer(),
                                child: Icon(
                                  Icons.menu,
                                  color: CafeKit.util.color.backgroundButton,
                                  size: 30,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  )
                ],
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CafeKit.util.cafeTextStyle.text,
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Builder(
                  builder: (context) => CafeKit.widget.button.formButton(
                    ButtonModel(label: "Suscribe", onTap: () {}),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
