abstract class Failure {}

class HomeFailure implements Failure {
  final String code;

  HomeFailure({required this.code});
}
