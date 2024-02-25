import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

class BackgroundOpacity extends StatelessWidget {

  final Function() onTap;

  const BackgroundOpacity({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 3.0],
            colors: [
              Colors.transparent,
              CafeKit.util.color.backgroundButton
            ],
          ),
        ),
      ),
    );
  }
}
