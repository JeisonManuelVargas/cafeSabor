import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/base/base_usecase.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/features/home/domain/repositories/home_auth_repository.dart';

class GetUserUseCase extends BaseUseCase<UserModel, NoParams> {
  GetUserUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) => homeRepository.getUser();
}
