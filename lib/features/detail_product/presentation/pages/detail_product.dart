// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/detail_product/presentation/widget/bar_selector.dart';
import 'package:cafe_sabor/features/detail_product/presentation/cubit/detail_product_cubit.dart';

class DetailProduct extends BasePage<DetailProductState, DetailProductCubit> {
  final ProductModel productModel;

  const DetailProduct({super.key, required this.productModel});

  @override
  DetailProductCubit createBloc(BuildContext context) =>
      sl<DetailProductCubit>()
        ..init(
          context,
          productModel: productModel,
        );

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
              CafeKit.widget.compositeWidgets.showerProduct(
                marginTopMain: 0.14,
                disableAnimation: true,
                images: state.product.images,
                backgroundColor: state.product.color,
                heightBackground: context.sizeHeight() * 0.56,
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              BarSelector(
                item: state.barSelectorSize,
                onTap: bloc.handledChangeSize,
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: context.sizeWidth() * 0.11),
                child: Text(
                  state.product.description,
                  textAlign: TextAlign.start,
                  style: CafeKit.util.cafeTextStyle.descriptionProduct,
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                    horizontal: context.sizeWidth() * 0.11),
                child: Text(
                  state.product.price.toString(),
                  style: CafeKit.util.cafeTextStyle.description,
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                    horizontal: context.sizeWidth() * 0.11),
                child: CafeKit.widget.button.formButton(
                  ButtonModel(label: "buy", onTap: () {}),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
