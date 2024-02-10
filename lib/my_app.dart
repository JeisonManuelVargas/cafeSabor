import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/navigation/navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.generateRoute,
      theme:  CafeKit.util.appThere.getThemeData(),
    );
  }
}