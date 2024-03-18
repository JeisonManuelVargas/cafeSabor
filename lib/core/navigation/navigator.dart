import 'dart:io';

import 'package:cafe_sabor/core/model/credential_model.dart';
import 'package:cafe_sabor/core/model/product_model.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/features/detail_product/presentation/pages/detail_product.dart';
import 'package:cafe_sabor/features/my_products/presentation/pages/my_products.dart';
import 'package:cafe_sabor/features/profile/presentation/pages/profile.dart';
import 'package:cafe_sabor/features/recipes/presentation/pages/recipes.dart';
import 'package:cafe_sabor/features/register_phone_number/presentation/pages/register_phone_number.dart';
import 'package:cafe_sabor/features/register_place_residence/presentation/pages/register_place_residence.dart';
import 'package:cafe_sabor/features/validate_phone_number/presentation/pages/validate_phone_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor/core/animations/fade_page_route.dart';
import 'package:cafe_sabor/features/home/presentation/pages/home.dart';
import 'package:cafe_sabor/features/onboard/presentation/pages/omboarding.dart';
import 'package:cafe_sabor/features/register_create_account/presentation/pages/register_create_account.dart';

enum Routes {
  HOME,
  ONBOARD,
  PROFILE,
  RECIPES,
  MY_PRODUCTS,
  CREATE_ACCOUNT,
  DETAIL_PRODUCT,
  REGISTER_PHONE_NUMBER,
  VALIDATE_PHONE_NUMBER,
  REGISTER_PLACE_RESIDENCE,
}

class _Page {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String recipes = '/recipes';
  static const String onboard = '/onboard';
  static const String myProducts = '/myProducts';
  static const String detailProduct = '/detailProduct';
  static const String createAccount = '/createAccount';
  static const String registerPhoneNumber = '/registerPhoneNumber';
  static const String registerPlaceResidence = '/registerPlaceResidence';
  static const String validatePhoneNumber = '/validatePhoneNumber';

  static const Map<Routes, String> _pageMap = {
    Routes.HOME: home,
    Routes.PROFILE: profile,
    Routes.RECIPES: recipes,
    Routes.ONBOARD: onboard,
    Routes.MY_PRODUCTS: myProducts,
    Routes.DETAIL_PRODUCT: detailProduct,
    Routes.CREATE_ACCOUNT: createAccount,
    Routes.REGISTER_PHONE_NUMBER: registerPhoneNumber,
    Routes.VALIDATE_PHONE_NUMBER: validatePhoneNumber,
    Routes.REGISTER_PLACE_RESIDENCE: registerPlaceResidence,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings, CredentialsModel credentials) {
    ProductModel productModel = ProductModel.init();
    UserModel userModel = UserModel.init();

    final params = settings.arguments;

    if (params is ProductModel) productModel = params;
    if (params is UserModel) userModel = params;

    switch (settings.name) {
      case _Page.home:
        return _pageRoute(
          page: const Home(),
          settings: settings,
        );
      case _Page.onboard:
        return _pageRoute(
          page: const Onboard(),
          settings: settings,
        );
      case _Page.createAccount:
        return _pageRoute(
          page: RegisterCreateAccount(userModel: userModel),
          settings: settings,
        );
      case _Page.registerPlaceResidence:
        return _pageRoute(
          page: RegisterPlaceResidence(userModel: userModel),
          settings: settings,
        );
      case _Page.registerPhoneNumber:
        return _pageRoute(
          page: RegisterPhoneNumber(userModel: userModel),
          settings: settings,
        );
      case _Page.validatePhoneNumber:
        return _pageRoute(
          page: ValidatePhoneNumber(userModel: userModel),
          settings: settings,
        );
      case _Page.profile:
        return _pageRoute(
          page: Profile(userModel: userModel),
          settings: settings,
        );
      case _Page.detailProduct:
        return _pageRoute(
          page: DetailProduct(productModel: productModel),
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
        );
      case _Page.myProducts:
        return _pageRoute(
          page: const MyProducts(),
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
        );
      case _Page.recipes:
        return _pageRoute(
          page: const Recipes(),
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
        );
      default: {
        if (credentials.email.isNotEmpty) {
          return _pageRoute(page: const Home(), settings: settings);
        } else {
          return _pageRoute(page: const Onboard(), settings: settings);
        }
      }
    }
  }

  static Route _pageRoute({
    required Widget page,
    Duration? transitionDuration,
    RouteSettings? settings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute<Route>(
            settings: settings,
            builder: (context) => page,
          )
        : FadeRoute(
            page: page,
            routeSettings: settings,
            transitionDuration: transitionDuration,
          ) as Route;
  }

  static Future push<T>(
    Routes route, {
    Object? arguments,
    Function(dynamic)? callBack,
  }) =>
      state
          .pushNamed(
            _Page.page(route)!,
            arguments: arguments,
          )
          .then(
            (value) => callBack != null ? callBack(value) : {},
          );

  static Future pushNamedAndRemoveUntil(Routes route, {Object? arguments}) =>
      state.pushNamedAndRemoveUntil(
        _Page.page(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static void pop({Object? params}) => state.pop(params);

  static void popUntil(Routes route) => state.popUntil(
        (routes) => routes.settings.name == _Page.page(route)!,
      );
}
