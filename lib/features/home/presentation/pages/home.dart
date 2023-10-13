// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart';
import 'package:cafe_sabor/core/base/base_page.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/features/home/presentation/cubit/home_cubit.dart';

class Home extends BasePage<HomeState, HomeCubit> {
  const Home({super.key});

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CafeKit.widget.form.input(label: "Email"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "CREATE A NEW ACCOUNT",
                style: CafeKit.util.cafeTextStyle.title,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "CREATE A NEW ACCOUNT",
                style: CafeKit.util.cafeTextStyle.description,
              ),
              const SizedBox(
                height: 20,
              ),
              CafeKit.widget.form.input(label: "reset password"),
              const SizedBox(
                height: 20,
              ),
              CafeKit.widget.form.input(label: "Password"),
              const SizedBox(
                height: 20,
              ),
              CafeKit.widget.button.formButton(ButtonModel(
                label: "Continuar",
                onTap: () {},
              )),
              const SizedBox(
                height: 20,
              ),
              CafeKit.widget.button.formButton(ButtonModel(
                type: ButtonType.light,
                label: "Continuar",
                onTap: () {},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
