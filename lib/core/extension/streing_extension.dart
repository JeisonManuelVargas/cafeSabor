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
}
