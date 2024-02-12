// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/config/credentials.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Material(
        color: CafeKit.util.color.backgroundButton,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.sizeHeight() * 0.1,
            horizontal: context.sizeWidth() * 0.09,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Scaffold.of(context).closeEndDrawer(),
                  icon: Icon(
                    Icons.close,
                    color: CafeKit.util.color.whiteCard,
                  ),
                ),
              ),
              SizedBox(height: context.sizeHeight() * 0.07),
              _generateOptions(
                title: "PROFILE",
                context: context,
                icon: Icons.person_2_outlined,
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  AppNavigator.push(Routes.PROFILE);
                },
              ),
              SizedBox(height: context.sizeHeight() * 0.02),
              _generateOptions(
                context: context,
                title: "PRODUCTS",
                icon: Icons.shopping_bag_outlined,
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  AppNavigator.push(Routes.MY_PRODUCTS);
                },
              ),
              SizedBox(height: context.sizeHeight() * 0.02),
              _generateOptions(
                title: "RECIPES",
                context: context,
                icon: Icons.coffee_outlined,
                onTap: () {},
              ),
              SizedBox(height: context.sizeHeight() * 0.02),
              _generateOptions(
                  title: "LOGOUT",
                  context: context,
                  icon: Icons.close,
                  onTap: () {
                    Credentials().delete();
                    AppNavigator.pushNamedAndRemoveUntil(Routes.ONBOARD);
                  },
                  customIcon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CafeKit.util.color.red,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.close,
                      color: CafeKit.util.color.red,
                      size: 13,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _generateOptions({
    Widget? customIcon,
    required IconData icon,
    required String title,
    required Function onTap,
    required BuildContext context,
  }) =>
      InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.sizeHeight() * 0.02),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: customIcon ?? Icon(icon),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: CafeKit.util.cafeTextStyle.description.copyWith(
                        fontWeight: FontWeight.w300,
                        color: CafeKit.util.color.whiteCard),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
