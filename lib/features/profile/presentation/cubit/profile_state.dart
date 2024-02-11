part of 'profile_cubit.dart';

class ProfileState {
  final int productIndex;
  final PageController controller;
  final List<ProductModel> products;

  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController emailController;
  final TextEditingController stateController;
  final TextEditingController countryController;
  final TextEditingController addressController;
  final TextEditingController lastNameController;

  const ProfileState({
    required this.products,
    required this.controller,
    required this.productIndex,
    required this.nameController,
    required this.cityController,
    required this.emailController,
    required this.stateController,
    required this.countryController,
    required this.addressController,
    required this.lastNameController,
  });

  factory ProfileState.init() => ProfileState(
        products: [],
        productIndex: 0,
        controller: PageController(),
        cityController: TextEditingController(),
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        stateController: TextEditingController(),
        addressController: TextEditingController(),
        countryController: TextEditingController(),
        lastNameController: TextEditingController(),
      );

  ProfileState copyWith({
    int? productIndex,
    List<ProductModel>? products,
  }) =>
      ProfileState(
        controller: controller,
        cityController: cityController,
        nameController: nameController,
        stateController: stateController,
        emailController: emailController,
        products: products ?? this.products,
        addressController: addressController,
        countryController: countryController,
        lastNameController: lastNameController,
        productIndex: productIndex ?? this.productIndex,
      );
}
