// ignore_for_file: depend_on_referenced_packages
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
                ],
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.sizeWidth() * 0.1),
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
