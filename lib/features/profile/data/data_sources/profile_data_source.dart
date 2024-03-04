import 'dart:io';

import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileDataSource {
  Future<bool> submit(UserModel user);
  Future<String> saveImage(File image);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore db;
  final String collection = 'users';

  ProfileDataSourceImpl({required this.db});

  @override
  Future<bool> submit(UserModel userModel) async {
    return true;
  }

  @override
  Future<String> saveImage(File image) async {
    return "String";
  }
}
