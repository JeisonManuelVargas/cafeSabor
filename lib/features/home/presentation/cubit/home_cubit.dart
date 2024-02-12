// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/base/base_usecase.dart';
import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:cafe_sabor/core/util/custom_snack_bar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:cafe_sabor/features/home/domain/usecases/get_user_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetUserUseCase _getUserUseCase;

  HomeCubit({
    required GetUserUseCase getUserUseCase,
  })  : _getUserUseCase = getUserUseCase,
        super(HomeState.init());

  init(BuildContext context) {
    emit(HomeState.init());
    _getUser(context);
    FlutterNativeSplash.remove();
  }

  handledChangeProductIndex(int index) => Future.delayed(
        const Duration(milliseconds: 300),
        () => emit(
          state.copyWith(productIndex: index),
        ),
      );

  goToDetailProduct(ProductModel productModel) => AppNavigator.push(
        Routes.DETAIL_PRODUCT,
        arguments: productModel,
      );

  _getUser(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getUserUseCase(NoParams());
    result.fold(
          (Failure l) => customSnackBar(context, content: l.message),
          (UserModel r) async => emit(state.copyWith(user: r)),
    );
    emit(state.copyWith(isLoading: false));
  }
}
