import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
