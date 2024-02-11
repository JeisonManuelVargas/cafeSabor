
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


abstract class ValidatePhoneNumberDataSource {
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> createDataUser({
    required UserModel userModel,
  });
}

class ValidatePhoneNumberDataSourceImpl implements ValidatePhoneNumberDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final String userCollection = 'users';

  ValidatePhoneNumberDataSourceImpl({
    required this.db,
    required this.auth,
  });

  @override
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  @override
  Future<UserModel> createDataUser({
    required UserModel userModel,
  }) async {
    db.collection(userCollection).doc().set(userModel.toJson());
    return userModel;
  }
}
