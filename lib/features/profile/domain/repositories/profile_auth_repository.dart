import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/model/user_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, bool>> submit(UserModel user);
  Future<Either<Failure, String>> saveImage(File image);
  Future<Either<Failure, bool>> saveUrlImage(UserModel user);
}
