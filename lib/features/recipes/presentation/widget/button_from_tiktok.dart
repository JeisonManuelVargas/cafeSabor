import 'package:flutter/material.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';

class ButtonFromTiktok extends StatelessWidget {
  final String image;
  final Function() onTap;

  const ButtonFromTiktok({super.key, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.sizeHeight() * 0.02),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CafeKit.util.color.whiteCard,
        ),
        child: Image.asset(
          image,
          height: context.sizeHeight() * 0.03,
        ),
      ),
    );
  }
}
