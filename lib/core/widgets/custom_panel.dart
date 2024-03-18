import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';

class CustomPanes extends StatelessWidget {
  final Widget panel;
  final Widget body;
  final PanelController controller;

  const CustomPanes({
    super.key,
    required this.body,
    required this.panel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: body,
      panel: panel,
      minHeight: 0,
      backdropOpacity: 0.7,
      backdropEnabled: true,
      controller: controller,
      backdropTapClosesPanel: true,
      maxHeight: context.sizeHeight() * 0.18,
      backdropColor: CafeKit.util.color.background,
    );
  }
}
