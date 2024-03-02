// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init(UserModel.init()));

  init(BuildContext context, UserModel user) => emit(ProfileState.init(user));

  handledChangeProductIndex(int index) => Future.delayed(
        const Duration(milliseconds: 300),
        () => emit(state.copyWith(productIndex: index)),
      );

  goToDetailProduct(ProductModel productModel) => AppNavigator.push(
        Routes.DETAIL_PRODUCT,
        arguments: productModel,
      );

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) emit(state.copyWith(image: File(pickedFile.path)));
  }
}











