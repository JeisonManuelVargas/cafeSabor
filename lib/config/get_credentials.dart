import 'package:cafe_sabor/core/model/credential_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Credentials {

  Future<CredentialsModel> get() async {
    final preference = await SharedPreferences.getInstance();
    String? email = preference.getString("email");
    String? password = preference.getString("password");

    return CredentialsModel(
      email: email??"",
      password: password??"",
    );
  }

  Future<void> set(CredentialsModel credentialsModel) async {
    final preference = await SharedPreferences.getInstance();

    preference.setString("email", credentialsModel.email);
    preference.setString("password", credentialsModel.password);
  }
}