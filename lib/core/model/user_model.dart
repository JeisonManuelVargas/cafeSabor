class UserModel {
  String name;
  String lastName;
  dynamic dateCreate;
  String email;
  String image;
  String language;
  List<Address> address;

  UserModel({
    required this.name,
    required this.lastName,
    required this.dateCreate,
    required this.email,
    required this.image,
    required this.language,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    lastName: json["last_name"],
    dateCreate: json["dateCreate"],
    email: json["email"],
    image: json["image"],
    language: json["language"],
    address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "last_name": lastName,
    "dateCreate": dateCreate,
    "email": email,
    "image": image,
    "language": language,
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
  };
}

class Address {
  String address;
  dynamic position;
  String description;
  dynamic dateCreate;

  Address({
    required this.address,
    required this.position,
    required this.description,
    required this.dateCreate,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    position: json["position"],
    description: json["description"],
    dateCreate: json["dateCreate"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "position": position,
    "description": description,
    "dateCreate": dateCreate,
  };
}
