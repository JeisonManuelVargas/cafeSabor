class InvalidCredentialException implements Exception {}

class HomeException implements Exception {
  final String code;

  HomeException({required this.code});
}
