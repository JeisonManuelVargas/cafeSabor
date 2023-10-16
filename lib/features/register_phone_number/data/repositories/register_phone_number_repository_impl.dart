import 'package:cafe_sabor/features/register_phone_number/data/data_sources/register_phone_number_data_source.dart';
import 'package:cafe_sabor/features/register_phone_number/domain/repositories/register_phone_number_repository.dart';

class RegisterPhoneNumberRepositoryImpl implements RegisterPhoneNumberRepository {
  RegisterPhoneNumberRepositoryImpl({required this.registerCreateAccountDataSource});

  final RegisterPhoneNumberDataSource registerCreateAccountDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await createAccountDataSource.getListMovies();
      return Right(result);
    } on RegisterPhoneNumberException catch (e) {
      return Left(RegisterPhoneNumberFailure(code: e.code));
    }
  }*/
}
