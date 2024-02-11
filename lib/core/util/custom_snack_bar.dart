import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

ScaffoldFeatureController customSnackBar(
  BuildContext context, {
  bool isSuccess = false,
  required String content,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? CafeKit.util.color.green : CafeKit.util.color.red,
        content: Text(
          content,
          style: TextStyle(color: CafeKit.util.color.textColor, letterSpacing: 0.5),
        ),
      ),
    );
