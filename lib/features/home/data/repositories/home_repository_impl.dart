import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/features/home/data/data_sources/home_data_source.dart';
import 'package:cafe_sabor/features/home/domain/repositories/home_auth_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeDataSource});

  final HomeDataSource homeDataSource;

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final result = await homeDataSource.getUser();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(HomeFailure(message: e.code));
    }
  }
}
