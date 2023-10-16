import 'package:cafe_sabor/features/validate_phone_number/data/data_sources/validate_phone_number_data_source.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/repositories/validate_phone_number_repository.dart';

class ValidatePhoneNumberRepositoryImpl implements ValidatePhoneNumberRepository {
  ValidatePhoneNumberRepositoryImpl({required this.registerCreateAccountDataSource});

  final ValidatePhoneNumberDataSource registerCreateAccountDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await createAccountDataSource.getListMovies();
      return Right(result);
    } on ValidatePhoneNumberException catch (e) {
      return Left(ValidatePhoneNumberFailure(code: e.code));
    }
  }*/
}
