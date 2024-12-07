// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? name;
  String? surname;
  String? role;
  String? jwt;

  LoginModel({
    this.name,
    this.surname,
    this.role,
    this.jwt,
  });

  LoginModel copyWith({
    String? name,
    String? surname,
    String? role,
    String? jwt,
  }) =>
      LoginModel(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        role: role ?? this.role,
        jwt: jwt ?? this.jwt,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        name: json["name"],
        surname: json["surname"],
        role: json["role"],
        jwt: json["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "role": role,
        "jwt": jwt,
      };
}
