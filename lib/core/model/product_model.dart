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
}
