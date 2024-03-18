// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';

import 'package:cafe_sabor/features/profile/presentation/widgets/phone_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:cafe_sabor/core/widgets/custom_panel.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/features/profile/presentation/widgets/user_image.dart';
import 'package:cafe_sabor/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cafe_sabor/features/home/presentation/widget/custom_drawer.dart';
import 'package:cafe_sabor/features/profile/presentation/widgets/image_panel.dart';

class Profile extends BasePage<ProfileState, ProfileCubit> {
  final UserModel userModel;

  const Profile({super.key, required this.userModel});

  @override
  ProfileCubit createBloc(BuildContext context) =>
      sl<ProfileCubit>()
        ..init(
          context,
          userModel
        );

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      endDrawer: CustomDrawer(user: state.user),
      body: CustomPanes(
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
                    horizontal: context.sizeHeight() * 0.03,
                  ),
                  child: CafeKit.widget.button.goBackButton(
                    onTap: () => AppNavigator.pop(),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.03),
                Stack(
                  children: [
                    Column(
                      children: [
                        Text(
                          state.user.name.toUpperCase(),
                          style: CafeKit.util.cafeTextStyle.titleXL,
                        ),
                        CafeKit.widget.card.simpleCard(
                          body: [
                            Text(
                              "${state.user.name} ${state.user.lastName}",
                              style: CafeKit.util.cafeTextStyle.text,
                            ),
                            SizedBox(height: context.sizeHeight() * 0.01),
                            Text(
                              "${state.user.address.first.city}/${state.user
                                  .address.first.state}",
                              style:
                              CafeKit.util.cafeTextStyle.descriptionProduct,
                            ),
                          ],
                        ),
                      ],
                    ),
                    UserImage(
                      chooseImage: bloc.activePanel,
                      isAsset: state.image.path.isNotEmpty,
                      image: state.image.path.isNotEmpty
                          ? state.image.path
                          : state.user.image,
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

                    PhoneFromFieldWidget(
                      phoneController: state.phoneController,
                    ),
                    /*CafeKit.widget.form.input(
                      label: "Phone",
                      controller: state.phoneController,
                      keyboardType: TextInputType.phone,
                      validator:
                    ),*/
                    SizedBox(height: context.sizeHeight() * 0.035),
                    CafeKit.widget.form.input(
                      label: "Email",
                      controller: state.emailController,
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: context.sizeHeight() * 0.1),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.sizeWidth() * 0.1,
                      ),
                      child: CafeKit.widget.button.formButton(
                        ButtonModel(
                          label: "Submit",
                          onTap: () => bloc.submit(context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.sizeHeight() * 0.1),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sizeWidth() * 0.1,
                  ),
                  child: CafeKit.widget.button.formButton(
                    ButtonModel(
                      label: "Log out",
                      onTap: bloc.logOut,
                    ),
                  ),
                ),
                SizedBox(height: context.sizeHeight() * 0.1),
              ],
            ),
          ),
        ),
        panel: ImagePanel(
          onTapCamera: bloc.getImage,
          onTapGallery: () => bloc.getImage(isCamera: false),
        ),
        controller: state.panelController,
      ),
    );
  }
}
