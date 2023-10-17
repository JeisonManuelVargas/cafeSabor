part of 'home_cubit.dart';

class HomeState {
  final int productIndex;
  final PageController controller;
  final List<ProductModel> products;

  const HomeState({
    required this.products,
    required this.controller,
    required this.productIndex,
  });

  factory HomeState.init() => HomeState(
        productIndex: 0,
        controller: PageController(),
        products: [
          ProductModel(
            name: "Borbón",
            color: CafeKit.util.color.lightYellow,
            description: "El café Arábica es significativo en la producción del café especial, y Bourbon es una de las variedades que toma protagonismo.",
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
            name: "Variedad Castillo",
            color: CafeKit.util.color.green,
            description: "La variedad Castillo, cuyo nombre es en honor al investigador Jaime Castillo Zapata, se obtuvo a partir del cruce de la variedad Caturra y el Híbrido de Timor.",
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

  HomeState copyWith({
    int? productIndex,
    List<ProductModel>? products,
  }) =>
      HomeState(
        controller: controller,
        products: products ?? this.products,
        productIndex: productIndex ?? this.productIndex,
      );
}
