// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:tiktok_transitions_jm/tiktok_transitions_jm.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';
import 'package:cafe_sabor/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:cafe_sabor/features/recipes/presentation/widget/button_from_tiktok.dart';
import 'package:cafe_sabor/features/recipes/presentation/widget/background_opacity.dart';

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
        builder: (context, body, tikTokManager) {
          return Stack(
            children: [
              body,
              BackgroundOpacity(onTap: () => bloc.onTapVideo(tikTokManager)),
              Positioned(
                bottom: context.sizeHeight() * 0.1,
                left: context.sizeWidth() * 0.08,
                child: SizedBox(
                  width: context.sizeWidth() * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: context.sizeWidth() * 0.05,
                        ),
                        child: Text(
                          "SABOR LATTE",
                          style: CafeKit.util.cafeTextStyle.title.copyWith(
                            color: CafeKit.util.color.whiteCard,
                          ),
                        ),
                      ),
                      SizedBox(height: context.sizeHeight() * 0.05),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        style: CafeKit.util.cafeTextStyle.descriptionProduct
                            .copyWith(color: CafeKit.util.color.whiteCard),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: context.sizeWidth() * 0.05,
                bottom: context.sizeHeight() * 0.1,
                child: Column(
                  children: [
                    ButtonFromTiktok(
                      onTap: () {},
                      image: "assets/icons/chat.png",
                    ),
                    SizedBox(height: context.sizeHeight() * 0.015),
                    ButtonFromTiktok(
                      onTap: () {},
                      image: "assets/icons/star.png",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
