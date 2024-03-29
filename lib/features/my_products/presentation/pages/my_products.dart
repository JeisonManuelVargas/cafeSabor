// ignore_for_file: depend_on_referenced_packages
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:cafe_sabor/features/my_products/presentation/widget/image_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';
import 'package:cafe_sabor/features/my_products/presentation/cubit/my_products_cubit.dart';

class MyProducts extends BasePage<MyProductsState, MyProductsCubit> {
  const MyProducts({super.key});

  @override
  MyProductsCubit createBloc(BuildContext context) =>
      sl<MyProductsCubit>()..init(context);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.sizeHeight() * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.sizeHeight() * 0.03),
                child: CafeKit.widget.button.goBackButton(
                  onTap: () => AppNavigator.pop(),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              CafeKit.widget.card.simpleCard(
                alignment: CrossAxisAlignment.start,
                paddingTop: context.sizeHeight() * 0.05,
                paddingLeft: context.sizeWidth() * 0.08,
                paddingRight: context.sizeWidth() * 0.08,
                body: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "MY\nPRODUCT",
                      style: CafeKit.util.cafeTextStyle.title,
                    ),
                  ),
                  SizedBox(height: context.sizeHeight() * 0.01),
                  Text(
                    "Suscribed products",
                    style: CafeKit.util.cafeTextStyle.descriptionProduct,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.04),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        state.products.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: context.sizeWidth() * 0.06,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageProductWidget(
                                color: state.products[index].color,
                                image: bloc.handledToFindImageProduct(
                                  state.products[index],
                                ),
                              ),
                              SizedBox(height: context.sizeHeight() * 0.02),
                              Text(
                                state.products[index].name,
                                maxLines: 2,
                                style: CafeKit
                                    .util.cafeTextStyle.descriptionProduct
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: context.sizeHeight() * 0.01),
                              Text("250 gr/big bag",
                                  style: CafeKit
                                      .util.cafeTextStyle.descriptionProduct),
                              SizedBox(height: context.sizeHeight() * 0.01),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: context.sizeHeight() * 0.01,
                                  horizontal: context.sizeWidth() * 0.03,
                                ),
                                decoration: BoxDecoration(
                                    color: CafeKit.util.color.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                    "${state.products[index].price} USD",
                                    style: CafeKit
                                        .util.cafeTextStyle.descriptionProduct),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.sizeWidth() * 0.1),
                child: CafeKit.widget.button.formButton(
                  ButtonModel(label: "More products", onTap: () {}),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
