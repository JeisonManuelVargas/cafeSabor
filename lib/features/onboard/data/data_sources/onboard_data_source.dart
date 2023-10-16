
abstract class OnboardDataSource {
  /*Future<List<MovieModel>> getListMovies();*/
}

class OnboardDataSourceImpl implements OnboardDataSource {
/*  final FirebaseFirestore db;
  final String userCollection = 'users';

  OnboardingDataSourceImpl({required this.db});

  @override
  Future<List<MovieModel>> getListMovies() async {
    try {
       final res = await AbstractApi().readData(urlSpecific: "movie/popular".stringToUri);
       List data = res.result['results'];
       final listMovie = data.map((e) => MovieModel.fromJson(e)).toList();
      return listMovie;
    } catch (e) {
      throw OnboardingException(code: 'Error al cargar datos desde la API');
    }
  }*/
}
