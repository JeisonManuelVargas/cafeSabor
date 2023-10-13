
abstract class HomeDataSource {
  /*Future<List<MovieModel>> getListMovies();*/
}

class HomeDataSourceImpl implements HomeDataSource {
/*  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<List<MovieModel>> getListMovies() async {
    try {
       final res = await AbstractApi().readData(urlSpecific: "movie/popular".stringToUri);
       List data = res.result['results'];
       final listMovie = data.map((e) => MovieModel.fromJson(e)).toList();
      return listMovie;
    } catch (e) {
      throw HomeException(code: 'Error al cargar datos desde la API');
    }
  }*/
}
