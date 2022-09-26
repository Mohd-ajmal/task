import 'dart:convert';

List<EmployeeDetails> employeeDetailsFromJson(String str) =>
    List<EmployeeDetails>.from(
        json.decode(str).map((x) => EmployeeDetails.fromJson(x)));

String employeeDetailsToJson(List<EmployeeDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeDetails {
  EmployeeDetails({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profileImage,
    required this.address,
    this.phone,
    this.website,
    this.company,
  });

  int id;
  String name;
  String username;
  String email;
  String? profileImage;
  Address address;
  String? phone;
  String? website;
  Company? company;

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profileImage: json["profile_image"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "profile_image": profileImage,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company == null ? null : company!.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
