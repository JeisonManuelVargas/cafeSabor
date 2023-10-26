part of 'detail_product_cubit.dart';

class DetailProductState {
  final int productIndex;
  final ProductModel product;
  final List<BarSelectorItemModel> barSelectorSize;

  const DetailProductState({
    required this.product,
    required this.productIndex,
    required this.barSelectorSize,
  });

  factory DetailProductState.init(ProductModel productModel) =>
      DetailProductState(
          productIndex: 0,
          product: productModel,
          barSelectorSize: [
            BarSelectorItemModel(name: "1/5 lb", state: false),
            BarSelectorItemModel(name: "1 lb", state: true)
          ]);

  DetailProductState copyWith({
    int? productIndex,
    ProductModel? product,
    List<BarSelectorItemModel>? barSelectorSize,
  }) =>
      DetailProductState(
        product: product ?? this.product,
        productIndex: productIndex ?? this.productIndex,
        barSelectorSize: barSelectorSize ?? this.barSelectorSize,
      );
}
