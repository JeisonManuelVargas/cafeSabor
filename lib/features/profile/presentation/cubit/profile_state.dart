part of 'profile_cubit.dart';

class ProfileState {
  final int productIndex;
  final PageController controller;
  final List<ProductModel> products;

  const ProfileState({
    required this.products,
    required this.controller,
    required this.productIndex,
  });

  factory ProfileState.init() => ProfileState(
        productIndex: 0,
        controller: PageController(),
        products: [],
      );

  ProfileState copyWith({
    int? productIndex,
    List<ProductModel>? products,
  }) =>
      ProfileState(
        controller: controller,
        products: products ?? this.products,
        productIndex: productIndex ?? this.productIndex,
      );
}
