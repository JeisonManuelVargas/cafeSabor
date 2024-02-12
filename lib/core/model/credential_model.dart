import 'dart:convert';

class CredentialsModel {
  final String id;
  final String email;
  final String password;

  CredentialsModel({
    required this.id,
    required this.email,
    required this.password,
  });

  CredentialsModel copyWith({
    String? id,
    String? email,
    String? password,
  }) =>
      CredentialsModel(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory CredentialsModel.fromJson(Map<String, dynamic> json) => CredentialsModel(
    id: json["id"],
    email: json["email"],
    password: json["password"],
  );
}
