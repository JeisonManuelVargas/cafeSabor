import 'package:cafe_sabor/config/credentials.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeDataSource {
  Future<UserModel> getUser();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<UserModel> getUser() async {
    final credentials = await Credentials().get();
    final reference = db.collection(userCollection).doc(credentials.id);
    final res = await reference.get();
    final user = UserModel.fromJson(res.data(), reference);
    return user;
  }
}
