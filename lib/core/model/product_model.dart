// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

class ProductModel {
  final String name;
  final Color color;
  final String description;
  final List<ShowerProductModel> images;

  ProductModel({
    required this.name,
    required this.color,
    required this.images,
    required this.description,
  });

  factory ProductModel.init() =>
      ProductModel(
        name: "",
        images: [],
        description: "",
        color: CafeKit.util.color.green,
      );

  ProductModel copyWith({
    String? name,
    Color? color,
    String? description,
    List<ShowerProductModel>? images,
  }) =>
      ProductModel(
        name: name ?? this.name,
        color: color ?? this.color,
        images: images ?? this.images,
        description: description ?? this.description,
      );

}
