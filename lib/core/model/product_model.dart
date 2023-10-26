// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';
import 'package:cafe_sabor_ui_kit/cafe_sabor_ui_kit.dart';

class ProductModel {
  final String name;
  final Color color;
  final double price;
  final String description;
  final List<ShowerProductModel> images;

  ProductModel({
    required this.name,
    required this.color,
    required this.price,
    required this.images,
    required this.description,
  });

  factory ProductModel.init() =>
      ProductModel(
        name: "",
        images: [],
        price: 0.0,
        description: "",
        color: CafeKit.util.color.green,
      );

  ProductModel copyWith({
    String? name,
    Color? color,
    double? price,
    String? description,
    List<ShowerProductModel>? images,
  }) =>
      ProductModel(
        name: name ?? this.name,
        color: color ?? this.color,
        price: price ?? this.price,
        images: images ?? this.images,
        description: description ?? this.description,
      );

}
