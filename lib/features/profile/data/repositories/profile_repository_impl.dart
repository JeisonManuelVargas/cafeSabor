import 'dart:io';

import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/features/profile/data/data_sources/profile_data_source.dart';
import 'package:cafe_sabor/features/profile/domain/repositories/profile_auth_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.profileDataSource});

  final ProfileDataSource profileDataSource;

  @override
  Future<Either<Failure, bool>> submit(UserModel user) async {
    try {
      final result = await profileDataSource.submit(user);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, String>> saveImage(File image) async {
    try {
      final result = await profileDataSource.saveImage(image);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveUrlImage(UserModel user) async {
    try {
      final result = await profileDataSource.saveUrlImage(user);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }
}
