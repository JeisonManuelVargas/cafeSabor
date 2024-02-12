import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/model/user_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserModel>> getUser();
}
