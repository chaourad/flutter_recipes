import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String firstname;
  String email;
  String password;

  User({
    required this.firstname,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "email": email,
        "password": password,
      };
}
