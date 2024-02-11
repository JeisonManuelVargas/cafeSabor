import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';

abstract class ValidatePhoneNumberRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> createDataUser({
    required UserModel userModel,
  });
}
