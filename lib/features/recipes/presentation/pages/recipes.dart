// ignore_for_file: depend_on_referenced_packages
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:tiktok_transitions_jm/tiktok_transitions_jm.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';
import 'package:cafe_sabor/features/recipes/presentation/cubit/recipes_cubit.dart';

class Recipes extends BasePage<RecipesState, RecipesCubit> {
  const Recipes({super.key});

  @override
  RecipesCubit createBloc(BuildContext context) =>
      sl<RecipesCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
        endDrawer: CustomDrawer(
          user: state.user,
        ),
        body: TikTokTransitionsJm(
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          urlList: state.listUrl,
          builder: (
            context,
            body,
            videoPlayerModel,
          ) =>
              Stack(
            children: [
              body,
              InkWell(
                onTap: () {
                  if (videoPlayerModel.controller!.value.isPlaying) {
                    videoPlayerModel.controller!.pause();
                  } else {
                    videoPlayerModel.controller!.play();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.4, 3.0],
                      colors: [Colors.transparent, CafeKit.util.color.backgroundButton],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 70,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.sizeHeight() * 0.02),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CafeKit.util.color.whiteCard,
                      ),
                      child: Image.asset(
                        "assets/icons/chat.png",
                        height: context.sizeHeight() * 0.03,
                      ),
                    ),
                    SizedBox(height: context.sizeHeight() * 0.015),
                    Container(
                      padding: EdgeInsets.all(context.sizeHeight() * 0.02),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CafeKit.util.color.whiteCard,
                      ),
                      child: Image.asset(
                        "assets/icons/star.png",
                        height: context.sizeHeight() * 0.03,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
