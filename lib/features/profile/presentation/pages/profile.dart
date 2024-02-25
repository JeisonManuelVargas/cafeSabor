// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';

class Profile extends BasePage<ProfileState, ProfileCubit> {
  final UserModel userModel;

  const Profile({super.key, required this.userModel});

  @override
  ProfileCubit createBloc(BuildContext context) => sl<ProfileCubit>()
    ..init(
      context,
      userModel,
    );

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      endDrawer: CustomDrawer(user: state.user),
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
                  CafeKit.widget.form.input(
                    label: "Name",
                    controller: state.nameController,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(
                    label: "Last name",
                    controller: state.lastNameController,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(
                    label: "Email",
                    controller: state.emailController,
                  ),
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
                  CafeKit.widget.form.input(
                    label: "Country",
                    controller: state.countryController,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(
                    label: "State",
                    controller: state.stateController,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(
                    label: "City",
                    controller: state.cityController,
                  ),
                  SizedBox(height: context.sizeHeight() * 0.035),
                  CafeKit.widget.form.input(
                    label: "Address",
                    controller: state.addressController,
                  ),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: context.sizeWidth() * 0.1),
                    child: CafeKit.widget.button.formButton(
                      ButtonModel(label: "Submit", onTap: () {}),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.sizeHeight() * 0.1),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.sizeWidth() * 0.1),
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
