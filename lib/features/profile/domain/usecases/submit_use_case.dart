import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/base/base_usecase.dart';
import 'package:cafe_sabor/features/profile/domain/repositories/profile_auth_repository.dart';

class SubmitUseCase extends BaseUseCase<bool, UserModel> {
  SubmitUseCase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(UserModel params) => profileRepository.submit(params);
}
