// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CarouselProductWidget extends StatelessWidget {
  final PageController controller;
  final List<ProductModel> products;
  final Function(ProductModel) onTapProduct;

  const CarouselProductWidget({
    Key? key,
    required this.products,
    required this.controller,
    required this.onTapProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sizeWidth(),
      height: context.sizeHeight() * 0.70,
      child: PageView.builder(
        controller: controller,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return CafeKit.widget.compositeWidgets.showerProduct(
            images: products[index].images,
            backgroundColor: products[index].color,
            onTap: ()=> onTapProduct(products[index]),
            heightBackground: context.sizeHeight() * 0.66,
            backgroundBody: [
              SizedBox(height: context.sizeHeight() * 0.23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Text(
                  "subscription packages",
                  style: CafeKit.util.cafeTextStyle.text,
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
              Center(
                child: Text(
                  products[index].name.toUpperCase(),
                  style: CafeKit.util.cafeTextStyle.titleXL.copyWith(
                    color: CafeKit.util.color.backgroundButton.withOpacity(0.05),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
