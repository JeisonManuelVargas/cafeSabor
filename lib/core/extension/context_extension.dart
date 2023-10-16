import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  double sizeHeight() => MediaQuery.of(this).size.height;
  double sizeWidth() => MediaQuery.of(this).size.width;
}
