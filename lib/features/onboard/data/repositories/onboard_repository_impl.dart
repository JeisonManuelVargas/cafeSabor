import 'package:cafe_sabor/features/onboard/data/data_sources/onboard_data_source.dart';
import 'package:cafe_sabor/features/onboard/domain/repositories/onboard_repository.dart';

class OnboardRepositoryImpl implements OnboardRepository {
  OnboardRepositoryImpl({required this.homeDataSource});

  final OnboardDataSource homeDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await homeDataSource.getListMovies();
      return Right(result);
    } on OnboardException catch (e) {
      return Left(OnboardFailure(code: e.code));
    }
  }*/
}
