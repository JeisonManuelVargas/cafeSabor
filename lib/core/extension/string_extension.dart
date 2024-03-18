extension ContextExtension on String {
  String getMessageFromCode() {
    switch (this) {
      case "invalid-credential":
        return "El usuario o contraseña son incorrectos";
      case "email-already-in-use":
        return "Este correo ya fue registrado anteriormente";
      default:
        return "Error no controlado";
    }
  }

  getFirstItem() => split(" ").first;

  bool validateEmail() {
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regExp.hasMatch(this);
  }
}
