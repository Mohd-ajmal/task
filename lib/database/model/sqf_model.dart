final String tableEmp = 'emp';

class EmpFields {
  static final List<String> values = [
    id,
    name,
    username,
    email,
    profileImage,
    phone,
    website,
    street,
    suite,
    city,
    zipcode,
    lat,
    lng,
    companyName,
    catchPhrase,
    bs
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String username = 'username';
  static const String email = 'email';
  static const String profileImage = 'profileImage';
  static const String phone = 'phone';
  static const String website = 'website';
  static const String street = 'street';
  static const String suite = 'suite';
  static const String city = 'city';
  static const String zipcode = 'zipcode';
  static const String lat = 'lat';
  static const String lng = 'lng';
  static const String companyName = 'companyName';
  static const String catchPhrase = 'catchPhrase';
  static const String bs = 'bs';
}

class Emp {
  final int id;
  final String name;
  final String username;
  final String email;
  String? profileImage;
  String? phone;
  String? website;
  final String street;
  final String suite;
  final String city;
  String? zipcode;
  final double lat;
  final double lng;
  String? companyName;
  String? catchPhrase;
  String? bs;

  Emp(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      this.profileImage,
      this.phone,
      this.website,
      required this.street,
      required this.suite,
      required this.city,
      this.zipcode,
      required this.lat,
      required this.lng,
      this.companyName,
      this.catchPhrase,
      this.bs});

  Emp copy({
    int? id,
    String? name,
    String? username,
    String? email,
    String? profileImage,
    String? phone,
    String? website,
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    double? lat,
    double? lng,
    String? companyName,
    String? catchPhrase,
    String? bs,
  }) =>
      Emp(
          id: id ?? this.id,
          name: name ?? this.name,
          username: username ?? this.username,
          email: email ?? this.email,
          profileImage: profileImage ?? this.profileImage,
          phone: phone ?? this.phone,
          website: website ?? this.website,
          street: street ?? this.street,
          suite: suite ?? this.suite,
          city: city ?? this.city,
          zipcode: zipcode ?? this.zipcode,
          lat: lat ?? this.lat,
          lng: lng ?? this.lng,
          companyName: companyName ?? this.companyName,
          catchPhrase: catchPhrase ?? this.catchPhrase,
          bs: bs ?? this.bs);

  static Emp fromJson(Map<String, Object?> json) => Emp(
      id: json[EmpFields.id] as int,
      name: json[EmpFields.name] as String,
      username: json[EmpFields.username] as String,
      email: json[EmpFields.email] as String,
      profileImage: json[EmpFields.profileImage] as String?,
      phone: json[EmpFields.phone] as String?,
      website: json[EmpFields.website] as String?,
      street: json[EmpFields.street] as String,
      suite: json[EmpFields.suite] as String,
      city: json[EmpFields.city] as String,
      lat: json[EmpFields.lat] as double,
      lng: json[EmpFields.lng] as double,
      companyName: json[EmpFields.companyName] as String?,
      catchPhrase: json[EmpFields.catchPhrase] as String?,
      bs: json[EmpFields.bs] as String?);

  Map<String, Object?> toJson() => {
        EmpFields.id: id,
        EmpFields.name: name,
        EmpFields.username: username,
        EmpFields.email: email,
        EmpFields.profileImage: profileImage,
        EmpFields.phone: phone,
        EmpFields.website: website,
        EmpFields.street: street,
        EmpFields.suite: suite,
        EmpFields.city: city,
        EmpFields.zipcode: zipcode,
        EmpFields.lat: lat,
        EmpFields.lng: lng,
        EmpFields.companyName: companyName,
        EmpFields.catchPhrase: catchPhrase,
        EmpFields.bs: bs
      };
}
