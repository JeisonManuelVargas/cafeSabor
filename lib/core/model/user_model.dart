import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String image;
  String phone;
  String password;
  String lastName;
  String language;
  DateTime dateCreate;
  DocumentReference? id;
  List<AddressModel> address;

  UserModel({
    this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.address,
    required this.lastName,
    required this.language,
    required this.password,
    required this.dateCreate,
  });

  factory UserModel.fromJson(json, DocumentReference id) => UserModel(
    id: id,
    name: json["name"],
    email: json["email"],
    image: json["image"],
    phone: json["phone"],
    password: json["password"],
    language: json["language"],
    lastName: json["last_name"],
    dateCreate: json["dateCreate"].toDate(),
    address: List<AddressModel>.from(json["address"].map((x) => AddressModel.fromJson(x))),
  );

  factory UserModel.init() => UserModel(
    name: "",
    image: "",
    email: "",
    phone: "",
    address: [AddressModel.init()],
    password: "",
    lastName: "",
    language: "en",
    dateCreate: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "image": image,
    "phone": phone,
    "password": password,
    "language": language,
    "last_name": lastName,
    "dateCreate": dateCreate,
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
  };


  UserModel copyWith({
    String? name,
    String? email,
    String? image,
    String? phone,
    String? password,
    String? lastName,
    String? language,
    DateTime? dateCreate,
    List<AddressModel>? address,
  }) =>
      UserModel(
        name: name ?? this.name,
        image: image ?? this.image,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        password: password ?? this.password,
        lastName: lastName ?? this.lastName,
        language: language ?? this.language,
        dateCreate: dateCreate ?? this.dateCreate,
      );
}

class AddressModel {
  String city;
  String state;
  String country;
  String address;
  dynamic position;
  DateTime dateCreate;

  AddressModel({
    required this.city,
    required this.state,
    required this.country,
    required this.address,
    required this.position,
    required this.dateCreate,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    city: json["city"],
    state: json["state"],
    address: json["address"],
    country: json["country"],
    position: json["position"],
    dateCreate: json["dateCreate"].toDate(),
  );


  factory AddressModel.init() => AddressModel(
    city: "",
    state: "",
    address: "",
    country: "",
    position: "",
    dateCreate: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "address": address,
    "country": country,
    "position": position,
    "dateCreate": dateCreate,
  };
}
