import 'package:cafe_sabor/features/register_create_account/data/data_sources/register_create_account_data_source.dart';
import 'package:cafe_sabor/features/register_create_account/domain/repositories/register_create_account_auth_repository.dart';

class RegisterCreateAccountRepositoryImpl implements RegisterCreateAccountRepository {
  RegisterCreateAccountRepositoryImpl({required this.registerCreateAccountDataSource});

  final RegisterCreateAccountDataSource registerCreateAccountDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await createAccountDataSource.getListMovies();
      return Right(result);
    } on RegisterCreateAccountException catch (e) {
      return Left(RegisterCreateAccountFailure(code: e.code));
    }
  }*/
}
