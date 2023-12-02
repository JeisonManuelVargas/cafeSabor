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
        products: [
          ProductModel(
            name: "Borbón",
            price: 17.9,
            color: CafeKit.util.color.lightYellow,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            images: [
              ShowerProductModel(
                width: 0.35,
                height: 0.42,
                url: "assets/image/bolsa.png",
                positionType: PositionType.MAIN,
              ),
              ShowerProductModel(
                width: 0.35,
                left: 0.12,
                height: 0.3,
                bottom: 0.13,
                url: "assets/image/flor.png",
                positionType: PositionType.BACK,
              ),
              ShowerProductModel(
                right: 0.17,
                width: 0.27,
                height: 0.17,
                bottom: 0.09,
                url: "assets/image/cafetera.png",
                positionType: PositionType.FRONT,
              ),
            ],
          ),
          ProductModel(
            price: 17.9,
            name: "Variedad Castillo",
            color: CafeKit.util.color.green,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            images: [
              ShowerProductModel(
                width: 0.35,
                height: 0.42,
                url: "assets/image/bolsa.png",
                positionType: PositionType.MAIN,
              ),
              ShowerProductModel(
                width: 0.45,
                right: 0.074,
                height: 0.33,
                bottom: 0.01,
                url: "assets/image/planta3.png",
                positionType: PositionType.BACK,
              ),
              ShowerProductModel(
                left: 0.15,
                width: 0.37,
                height: 0.27,
                bottom: 0.17,
                url: "assets/image/colibriImag.png",
                positionType: PositionType.FRONT,
              ),
            ],
          ),
        ],
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
