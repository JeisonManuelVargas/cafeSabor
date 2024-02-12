import 'package:cafe_sabor/core/model/user_model.dart';

extension ContextExtension on UserModel {
  String fullNAme() => name.isNotEmpty ? "$name $lastName" : "";
}
