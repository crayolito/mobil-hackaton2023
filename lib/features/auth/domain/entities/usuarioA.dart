class UsuarioA {
  int id;
  String name;
  int ci;
  int phoneNumber;
  String photoUrl;
  String password;
  int idrol;
  String idToken;
  String ic;
  String direction;
  double longitude;
  double latitude;
  String responsible;
  DateTime createdAt;

  UsuarioA({
    required this.id,
    required this.name,
    required this.ci,
    required this.phoneNumber,
    required this.photoUrl,
    required this.password,
    required this.idrol,
    required this.idToken,
    required this.ic,
    required this.direction,
    required this.longitude,
    required this.latitude,
    required this.responsible,
    required this.createdAt,
  });

  factory UsuarioA.fromJson(Map<String, dynamic> json) => UsuarioA(
        id: json["id"],
        name: json["name"],
        ci: json["ci"],
        phoneNumber: json["phone_number"],
        photoUrl: json["photo_url"],
        password: json["password"],
        idrol: json["idrol"],
        idToken: json["idToken"] ?? '',
        ic: json["ic"] ?? '',
        direction: json["direction"] ?? '',
        longitude: json["longitude"]?.toDouble() ?? 0.0,
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        responsible: json["responsible"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ci": ci,
        "phone_number": phoneNumber,
        "photo_url": photoUrl,
        "password": password,
        "idrol": idrol,
        "idToken": idToken,
        "ic": ic,
        "direction": direction,
        "longitude": longitude,
        "latitude": latitude,
        "responsible": responsible,
        "createdAt": createdAt.toIso8601String(),
      };
}
