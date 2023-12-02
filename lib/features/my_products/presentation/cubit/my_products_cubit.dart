// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_products_state.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit() : super(MyProductsState.init());

  init(BuildContext context) => emit(MyProductsState.init());

  handledChangeProductIndex(int index) => Future.delayed(
        const Duration(milliseconds: 300),
        () => emit(state.copyWith(productIndex: index)),
      );

  goToDetailProduct(ProductModel productModel) => AppNavigator.push(
        Routes.DETAIL_PRODUCT,
        arguments: productModel,
      );

  String handledToFindImageProduct(ProductModel productModel) =>
      productModel.images
          .firstWhere((element) => element.positionType == PositionType.MAIN)
          .url;
}
