import 'package:cafe_sabor/core/model/credential_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';

class MyApp extends StatelessWidget {

  final CredentialsModel credentials;

  const MyApp({super.key, required this.credentials});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      theme:  CafeKit.util.appThere.getThemeData(),
      onGenerateRoute: (RouteSettings settings) => AppNavigator.generateRoute(settings, credentials),
    );
  }
}