import 'package:flutter/cupertino.dart';

class AnimatedDescriptionWidget extends StatefulWidget {
  final Widget body;
  final PageController pageController;
  final Function(AnimationController, int) handledReturnController;

  const AnimatedDescriptionWidget({
    Key? key,
    required this.body,
    required this.pageController,
    required this.handledReturnController,
  }) : super(key: key);

  @override
  State<AnimatedDescriptionWidget> createState() =>
      _AnimatedDescriptionWidgetState();
}

class _AnimatedDescriptionWidgetState extends State<AnimatedDescriptionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> initOpacity;
  late Animation<double> endOpacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    initOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    endOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    widget.pageController.addListener(() {
       String item = widget.pageController.page!.toString().split(".")[1];
      if (item == "0") {
        widget.handledReturnController(controller, widget.pageController.page!.floor());
      }
    });

    controller.addListener(() {
      if (controller.isCompleted) controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, container) {
        return Opacity(
          opacity: initOpacity.value + endOpacity.value,
          child: widget.body,
        );
      },
      child: const SizedBox(),
    );
  }
}
