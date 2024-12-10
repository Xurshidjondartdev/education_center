// To parse this JSON data, do
//
//     final createModel = createModelFromJson(jsonString);

import 'dart:convert';

CreateModel createModelFromJson(String str) =>
    CreateModel.fromJson(json.decode(str));

String createModelToJson(CreateModel data) => json.encode(data.toJson());

class CreateModel {
  String? name;
  String? surname;
  String? phone;
  String? role;

  CreateModel({
    this.name,
    this.surname,
    this.phone,
    this.role,
  });

  CreateModel copyWith({
    String? name,
    String? surname,
    String? phone,
    String? role,
  }) =>
      CreateModel(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        phone: phone ?? this.phone,
        role: role ?? this.role,
      );

  factory CreateModel.fromJson(Map<String, dynamic> json) => CreateModel(
        name: json["name"],
        surname: json["surname"],
        phone: json["phone"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "phone": phone,
        "role": role,
      };
}
