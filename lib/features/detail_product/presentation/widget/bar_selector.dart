// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:cafe_sabor/core/extension/context_extension.dart';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';
import 'package:flutter/material.dart';

class BarSelectorItemModel {
  final bool state;
  final String name;

  BarSelectorItemModel({
    required this.name,
    required this.state,
  });

  BarSelectorItemModel copyWith({
    String? name,
    bool? state,
  }) =>
      BarSelectorItemModel(
        name: name ?? this.name,
        state: state ?? this.state,
      );
}

class BarSelector extends StatelessWidget {
  final Function(String) onTap;
  final List<BarSelectorItemModel> item;

  const BarSelector({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 2,
          width: context.sizeWidth() * 0.13,
          color: CafeKit.util.color.grey,
        ),
        SizedBox(
          width: context.sizeWidth() * 0.74,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              item.length,
              (index) => Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () => onTap(item[index].name),
                    child: _generateItem(item[index]),
                  )),
            ),
          ),
        ),
        Container(
          height: 2,
          width: context.sizeWidth() * 0.13,
          color: CafeKit.util.color.grey,
        )
      ],
    );
  }

  _generateItem(BarSelectorItemModel item) => Column(
        children: [
          Text(
            item.name,
            style: CafeKit.util.cafeTextStyle.description.copyWith(
              color: item.state ? null : CafeKit.util.color.grey,
            ),
          ),
          Container(
            height: 2,
            color: item.state
                ? CafeKit.util.color.backgroundButton
                : CafeKit.util.color.grey,
          )
        ],
      );
}
