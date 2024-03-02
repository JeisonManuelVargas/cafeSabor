part of 'profile_cubit.dart';

class ProfileState {
  final File image;
  final UserModel user;
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
    required this.user,
    required this.image,
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

  factory ProfileState.init(UserModel user) {
    AddressModel addressModel = user.address.first;

    return ProfileState(
      user: user,
      products: [],
      image: File(""),
      productIndex: 0,
      controller: PageController(),
      nameController: TextEditingController(text: user.name),
      emailController: TextEditingController(text: user.email),
      cityController: TextEditingController(text: addressModel.city),
      lastNameController: TextEditingController(text: user.lastName),
      stateController: TextEditingController(text: addressModel.state),
      addressController: TextEditingController(text: addressModel.address),
      countryController: TextEditingController(text: addressModel.country),
    );
  }

  ProfileState copyWith({
    File? image,
    UserModel? user,
    int? productIndex,
    List<ProductModel>? products,
  }) =>
      ProfileState(
        controller: controller,
        user: user ?? this.user,
        image: image ?? this.image,
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
