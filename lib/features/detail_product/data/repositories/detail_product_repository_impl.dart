import 'package:cafe_sabor/features/detail_product/data/data_sources/detail_product_data_source.dart';
import 'package:cafe_sabor/features/detail_product/domain/repositories/detail_product_auth_repository.dart';

class DetailProductRepositoryImpl implements DetailProductRepository {
  DetailProductRepositoryImpl({required this.homeDataSource});

  final DetailProductDataSource homeDataSource;

/*  @override
  Future<Either<Failure, List<MovieModel>>> getListMovie() async {
    try {
      final result = await homeDataSource.getListMovies();
      return Right(result);
    } on DetailProductException catch (e) {
      return Left(DetailProductFailure(code: e.code));
    }
  }*/
}
