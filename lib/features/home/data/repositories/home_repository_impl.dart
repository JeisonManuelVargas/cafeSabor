import 'package:cafe_sabor/features/home/data/data_sources/home_data_source.dart';
import 'package:cafe_sabor/features/home/domain/repositories/home_auth_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeDataSource});

  final HomeDataSource homeDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await homeDataSource.getListMovies();
      return Right(result);
    } on HomeException catch (e) {
      return Left(HomeFailure(code: e.code));
    }
  }*/
}
