part of 'profile_cubit.dart';

class ProfileState {
  final File image;
  final bool isLoading;
  final UserModel user;
  final int productIndex;
  final PageController controller;
  final List<ProductModel> products;
  final PanelController panelController;
  final PhoneController phoneController;
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
    required this.isLoading,
    required this.controller,
    required this.productIndex,
    required this.nameController,
    required this.cityController,
    required this.phoneController,
    required this.panelController,
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
      isLoading: false,
      controller: PageController(),
      panelController: PanelController(),
      nameController: TextEditingController(text: user.name),
      emailController: TextEditingController(text: user.email),
      phoneController: PhoneController(initialValue: PhoneNumber(isoCode: IsoCode.CO, nsn: user.phone)),
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
    bool? isLoading,
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
        phoneController: phoneController,
        emailController: emailController,
        panelController: panelController,
        products: products ?? this.products,
        addressController: addressController,
        countryController: countryController,
        isLoading: isLoading ?? this.isLoading,
        lastNameController: lastNameController,
        productIndex: productIndex ?? this.productIndex,
      );
}
