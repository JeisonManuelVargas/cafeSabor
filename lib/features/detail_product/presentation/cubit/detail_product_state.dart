part of 'detail_product_cubit.dart';

class DetailProductState {
  final int productIndex;
  final ProductModel product;

  const DetailProductState({
    required this.product,
    required this.productIndex,
  });

  factory DetailProductState.init(ProductModel productModel) => DetailProductState(
        productIndex: 0,
        product: productModel,
      );

  DetailProductState copyWith({
    int? productIndex,
    ProductModel? product,
  }) =>
      DetailProductState(
        product: product ?? this.product,
        productIndex: productIndex ?? this.productIndex,
      );
}
