// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:tiktok_transitions_jm/tiktok_transitions_jm.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesState.init());

  init(BuildContext context) {}

  onTapVideo(TikTokModel tikTokManager) {
    if (tikTokManager.controller!.value.isPlaying) {
      tikTokManager.controller!.pause();
    } else {
      tikTokManager.controller!.play();
    }
  }
}
