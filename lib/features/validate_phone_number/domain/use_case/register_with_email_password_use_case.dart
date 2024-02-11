import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/base/base_usecase.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/repositories/validate_phone_number_repository.dart';

class RegisterWithEmailPasswordUseCase extends BaseUseCase<String, RegisterWithEmailPasswordParams> {
  RegisterWithEmailPasswordUseCase({required this.validatePhoneNumberRepository});

  final ValidatePhoneNumberRepository validatePhoneNumberRepository;

  @override
  Future<Either<Failure, String>> call(RegisterWithEmailPasswordParams params) =>
      validatePhoneNumberRepository.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class RegisterWithEmailPasswordParams {
  RegisterWithEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
