import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';

class ImageProductWidget extends StatelessWidget {
  final Color color;
  final String image;

  const ImageProductWidget({
    super.key,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: context.sizeHeight() * 0.22,
          width: context.sizeWidth() * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: context.sizeHeight() * 0.024),
          height: context.sizeHeight() * 0.22,
          width: context.sizeWidth() * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
          ),
        )
      ],
    );
  }
}
