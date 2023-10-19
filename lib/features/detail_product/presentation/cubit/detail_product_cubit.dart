// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafe_sabor/core/model/product_model.dart';

part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  DetailProductCubit() : super(DetailProductState.init(ProductModel.init()));

  init(
    BuildContext context, {
    required ProductModel productModel,
  }) {
    final newImages = productModel.images.map((e) {
      final newElement = e.copyWith(
        width: e.width * 1.15,
        height: e.height * 1.15,
        left: e.left != null ? e.left! * 0.45 : null,
        right: e.right != null ? e.right! * 0.45 : null,
      );
      return newElement;
    }).toList();

    ProductModel newProductModel = productModel.copyWith(images: newImages);

    emit(DetailProductState.init(newProductModel));
  }

  handledChangeProductIndex(int index) => Future.delayed(
        const Duration(milliseconds: 300),
        () => emit(state.copyWith(productIndex: index)),
      );
}
