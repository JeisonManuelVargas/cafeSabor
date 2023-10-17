import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ColombianCoffeeWidget extends StatefulWidget {
  const ColombianCoffeeWidget({Key? key}) : super(key: key);

  @override
  State<ColombianCoffeeWidget> createState() => _ColombianCoffeeWidgetState();
}

class _ColombianCoffeeWidgetState extends State<ColombianCoffeeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    rotationController = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
        Future.delayed(const Duration(seconds: 2), () {
          controller.forward();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, body) => Transform.rotate(
            angle: rotationController.value,
            child: Image(
              width: context.sizeWidth() * 0.3,
              height: context.sizeHeight() * 0.15,
              image: const AssetImage("assets/image/Component2.png"),
            ),
          ),
        ),
        Image(
          width: context.sizeWidth() * 0.13,
          height: context.sizeHeight() * 0.1,
          image: const AssetImage("assets/image/100%.png"),
        ),
      ],
    );
  }
}
