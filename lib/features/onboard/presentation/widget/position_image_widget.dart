// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

class PositionImageWidget extends StatelessWidget {
  final double? top;
  final double? left;
  final double angle;
  final double width;
  final String image;
  final double height;
  final double? right;
  final double? bottom;
  final FromAnimation fromAnimation;

  const PositionImageWidget({
    Key? key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.angle = 0,
    required this.width,
    required this.image,
    required this.height,
    this.fromAnimation = FromAnimation.fromDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: Transform.rotate(
          angle: angle,
          child: CafeKit.widget.animate.animateContainer(
            fromAnimationModel: FromAnimationModel(
              fromAnimation: fromAnimation,
              child: Image(
                width: width,
                height: height,
                image: AssetImage(image),
              ),
            ),
          ),
        ),
      );
}
