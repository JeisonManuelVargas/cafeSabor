part of 'my_products_cubit.dart';

class MyProductsState {
  final int productIndex;
  final PageController controller;
  final List<ProductModel> products;

  const MyProductsState({
    required this.products,
    required this.controller,
    required this.productIndex,
  });

  factory MyProductsState.init() => MyProductsState(
        productIndex: 0,
        controller: PageController(),
        products: [],
      );

  MyProductsState copyWith({
    int? productIndex,
    List<ProductModel>? products,
  }) =>
      MyProductsState(
        controller: controller,
        products: products ?? this.products,
        productIndex: productIndex ?? this.productIndex,
      );
}
