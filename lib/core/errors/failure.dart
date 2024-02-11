abstract class Failure {
  late String message;
}

class ValidatePhoneNumberFailure implements Failure {
  @override
  String message;

  ValidatePhoneNumberFailure({this.message = ""});
}
