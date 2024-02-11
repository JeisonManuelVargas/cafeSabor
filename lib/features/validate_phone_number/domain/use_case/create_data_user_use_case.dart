import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/model/user_model.dart';
import 'package:cafe_sabor/core/base/base_usecase.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/repositories/validate_phone_number_repository.dart';

class CreateDataUserUseCase extends BaseUseCase<UserModel, UserModel> {
  CreateDataUserUseCase({required this.validatePhoneNumberRepository});

  final ValidatePhoneNumberRepository validatePhoneNumberRepository;

  @override
  Future<Either<Failure, UserModel>> call(UserModel params) =>
      validatePhoneNumberRepository.createDataUser(
        userModel: params,
      );
}
