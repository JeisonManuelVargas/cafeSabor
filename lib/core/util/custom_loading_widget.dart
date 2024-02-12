import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const CustomLoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child:
                  child is Text ? _generateTexContainer(child as Text, context) : child,
            ),
          )
        : child;
  }

  Widget _generateTexContainer(Text child, BuildContext context) {
    String data = child.data ?? "";

    List<Widget> listData = data
        .split(" ")
        .map(
          (element) => Container(
            height: _generateHeight(child, context),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "               $element             ",
            ),
          ),
        )
        .toList();

    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: listData,
    );
  }

   double _generateHeight(Text child,BuildContext context){
    if(child.style != null && child.style!.fontSize!= null) return context.sizeHeight() * (child.style!.fontSize! * 0.0016);
    return context.sizeHeight() * 0.025;
  }
}
