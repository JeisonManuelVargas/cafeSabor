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

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesState.init());

  init(BuildContext context) {}
}
