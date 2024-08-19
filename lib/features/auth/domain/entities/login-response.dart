// // To parse this JSON data, do
// //
// //     final loginResponse = loginResponseFromJson(jsonString);

// // To parse this JSON data, do
// //
// //     final loginResponse = loginResponseFromJson(jsonString);

// import 'package:chat_app/features/auth/domain/entities/usuario.dart';
// import 'package:chat_app/features/auth/infrastucture/mappers/user_mapper.dart';

// class LoginResponse {
//   bool ok;
//   Usuario usuario;
//   String token;

//   LoginResponse({
//     required this.ok,
//     required this.usuario,
//     required this.token,
//   });

//   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         ok: json["ok"],
//         usuario: UserMapper.fromJson(json["usuario"]),
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson(Usuario usuario) => {
//         "ok": ok,
//         "usuario": UserMapper.toJson(usuario),
//         "token": token,
//       };
// }
