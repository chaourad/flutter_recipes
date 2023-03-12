import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recipes/Models/User_model.dart';

Future<http.Response?> register(User data) async {
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("http://localhost:8080/api/v1/auth/register"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
  }
  return response;
}