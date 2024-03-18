import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';

class ImagePanel extends StatelessWidget {
  final Function() onTapCamera;
  final Function() onTapGallery;

  const ImagePanel({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: onTapCamera,
            child: Container(
              alignment: Alignment.center,
              height: context.sizeHeight() * 0.07,
              width: context.sizeWidth(),
              child: Text(
                "Camera",
                style: CafeKit.util.cafeTextStyle.titleBorna,
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.sizeWidth() * 0.07),
            child: Divider(
              color: CafeKit.util.color.background,
            ),
          ),
          InkWell(
            onTap: onTapGallery,
            child: Container(
              alignment: Alignment.center,
              height: context.sizeHeight() * 0.07,
              width: context.sizeWidth(),
              child: Text(
                "Gallery",
                style: CafeKit.util.cafeTextStyle.titleBorna,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
