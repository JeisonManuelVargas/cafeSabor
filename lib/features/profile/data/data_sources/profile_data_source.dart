import 'dart:io';

import 'package:cafe_sabor/core/extension/map_extension.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileDataSource {
  Future<bool> submit(UserModel user);
  Future<String> saveImage(File image);
  Future<bool> saveUrlImage(UserModel user);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore db;
  final FirebaseStorage storage;
  final String collection = 'users';

  ProfileDataSourceImpl({required this.db, required this.storage});

  @override
  Future<bool> submit(UserModel userModel) async {
    userModel.id!.update(userModel.toJsonUpdate().withoutNulls());
    return true;
  }

  @override
  Future<String> saveImage(File image) async {
    String newPath = image.path;
    String name = image.path.split("/").last;
    Reference storageReference = storage.ref("profile_image");
    TaskSnapshot saveAudio = await storageReference.child(name).putFile(File(newPath));
    String url =  await saveAudio.ref.getDownloadURL();
    return url;
  }

  @override
  Future<bool> saveUrlImage(UserModel user) async {
    await user.id!.update({"image": user.image});
    return true;
  }
}
