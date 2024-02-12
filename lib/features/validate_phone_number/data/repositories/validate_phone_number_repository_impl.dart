import 'package:cafe_sabor/core/extension/string_extension.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/features/validate_phone_number/data/data_sources/validate_phone_number_data_source.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/repositories/validate_phone_number_repository.dart';

class ValidatePhoneNumberRepositoryImpl implements ValidatePhoneNumberRepository {
  ValidatePhoneNumberRepositoryImpl({required this.validatePhoneNumberDataSource});

  final ValidatePhoneNumberDataSource validatePhoneNumberDataSource;

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await validatePhoneNumberDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(ValidatePhoneNumberFailure(message: e.code.getMessageFromCode()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> createDataUser({
    required UserModel userModel,
  }) async {
    try {
      final result = await validatePhoneNumberDataSource.createDataUser(userModel: userModel);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(ValidatePhoneNumberFailure(message: e.code.getMessageFromCode()));
    }
  }
}
