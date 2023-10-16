import 'package:cafe_sabor/features/register_place_residence/data/data_sources/register_place_residence_data_source.dart';
import 'package:cafe_sabor/features/register_place_residence/domain/repositories/register_place_residence_repository.dart';

class RegisterPlaceResidenceRepositoryImpl implements RegisterPlaceResidenceRepository {
  RegisterPlaceResidenceRepositoryImpl({required this.createAccountDataSource});

  final RegisterPlaceResidenceDataSource createAccountDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await createAccountDataSource.getListMovies();
      return Right(result);
    } on CreateAccountException catch (e) {
      return Left(CreateAccountFailure(code: e.code));
    }
  }*/
}
