import 'dart:convert';

class CredentialsModel {
  final String email;
  final String password;

  CredentialsModel({
    required this.email,
    required this.password,
  });

  CredentialsModel copyWith({
    String? email,
    String? password,
  }) =>
      CredentialsModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory CredentialsModel.fromRawJson(String str) => CredentialsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CredentialsModel.fromJson(Map<String, dynamic> json) => CredentialsModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
