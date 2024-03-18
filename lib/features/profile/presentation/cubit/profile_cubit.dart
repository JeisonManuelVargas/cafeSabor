// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cafe_sabor/config/credentials.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:cafe_sabor/core/util/custom_snack_bar.dart';
import 'package:cafe_sabor/core/extension/string_extension.dart';
import 'package:cafe_sabor/features/profile/domain/usecases/submit_use_case.dart';
import 'package:cafe_sabor/features/profile/domain/usecases/save_image_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SubmitUseCase _submitUseCase;
  final SaveImageUseCase _saveImageUseCase;

  ProfileCubit({
    required SubmitUseCase submitUseCase,
    required SaveImageUseCase saveImageUseCase,
  })  : _submitUseCase = submitUseCase,
        _saveImageUseCase = saveImageUseCase,
        super(ProfileState.init(UserModel.init()));

  init(BuildContext context, UserModel user) => emit(ProfileState.init(user));

  handledChangeProductIndex(int index) => Future.delayed(
        const Duration(milliseconds: 300),
        () => emit(state.copyWith(productIndex: index)),
      );

  goToDetailProduct(ProductModel productModel) => AppNavigator.push(
        Routes.DETAIL_PRODUCT,
        arguments: productModel,
      );

  Future getImage({bool isCamera = true}) async {
    state.panelController.close();
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) emit(state.copyWith(image: File(pickedFile.path)));
  }

  void logOut() {
    Credentials().delete();
    AppNavigator.pushNamedAndRemoveUntil(Routes.ONBOARD);
  }

  submit(context) async {
    if(!state.formKey.currentState!.validate()) return;
    emit(state.copyWith(isLoading: true));
    final result = await _submitUseCase(_generateUserModel());
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (bool r) async => customSnackBar(
        context,
        content: "user edited successfully",
        isSuccess: true,
      ),
    );
    emit(state.copyWith(isLoading: false));
  }

  saveImageUseCase(context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _saveImageUseCase(state.image);
    result.fold(
      (Failure l) => customSnackBar(context, content: l.message),
      (String r) {
        final user = state.user.copyWith(image: r);
        emit(state.copyWith(user: user));
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  void activePanel() => state.panelController.open();

  void closePanel() => state.panelController.close();

  _generateUserModel() => UserModel.init().copyWith(
        id: state.user.id,
        image: state.user.image,
        name: state.nameController.text,
        email: state.emailController.text,
        phone: state.phoneController.value.nsn,
        lastName: state.lastNameController.text,
      );

  String? validatorName(String? text){
    String newText = text??"";
    if(newText.isEmpty) return "can't be empty";
    return null;
  }

  String? validatorEmail(String? text){
    String newText = text??"";
    if(newText.isEmpty) return "can't be empty";
    if(!newText.validateEmail()) return "incorrect format";
    return null;
  }

  @override
  Future<void> close() {
    state.controller.dispose();
    state.cityController.clear();
    state.nameController.clear();
    state.emailController.clear();
    state.stateController.clear();
    state.phoneController.dispose();
    state.addressController.clear();
    state.lastNameController.clear();
    state.countryController.clear();
    return super.close();
  }
}
