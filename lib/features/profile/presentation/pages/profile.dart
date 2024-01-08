// ignore_for_file: depend_on_referenced_packages
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';

class Profile extends BasePage<ProfileState, ProfileCubit> {
  const Profile({super.key});

  @override
  ProfileCubit createBloc(BuildContext context) =>
      sl<ProfileCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      body: SizedBox(
        width: context.sizeWidth(),
        height: context.sizeHeight(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.sizeHeight() * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.sizeHeight() * 0.03),
                child: CafeKit.widget.button.goBackButton(
                  onTap: () => AppNavigator.pop(),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              Text(
                "JEISON",
                style: CafeKit.util.cafeTextStyle.titleXL,
              ),
              SizedBox(height: context.sizeHeight() * 0.05),
              CafeKit.widget.card.simpleCard(
                body: [
                  Text(
                    "Jeison Manuel Vargas Vargas",
                    style: CafeKit.util.cafeTextStyle.text,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.01),
                  Text(
                    "Pitalito Huila",
                    style: CafeKit.util.cafeTextStyle.descriptionProduct,
                  ),
                ],
              ),
              CafeKit.widget.card.simpleCard(
                body: [
                  CafeKit.widget.form.input(label: "Name"),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(label: "Last name"),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(label: "Email"),
                ],
              ),
              CafeKit.widget.card.simpleCard(
                alignment: CrossAxisAlignment.start,
                paddingTop: context.sizeHeight() * 0.05,
                body: [
                  Text(
                    "Add new address",
                    style: CafeKit.util.cafeTextStyle.titleBorna,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(label: "Country"),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(label: "State"),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(label: "City"),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(label: "Address"),
                ],
              ),
              CafeKit.widget.card.simpleCard(
                alignment: CrossAxisAlignment.start,
                paddingTop: context.sizeHeight() * 0.05,
                body: [
                  Text(
                    "Select category",
                    style: CafeKit.util.cafeTextStyle.titleBorna,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.sizeWidth() * 0.1),
                    child: CafeKit.widget.button.formButton(
                      ButtonModel(label: "Submit", onTap: () {}),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.sizeWidth() * 0.1),
                child: CafeKit.widget.button.formButton(
                  ButtonModel(label: "Log out", onTap: () {}),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
