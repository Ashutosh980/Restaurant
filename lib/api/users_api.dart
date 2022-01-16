import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;
import 'package:apicalling/model/al.dart';

Future<List<Al>> getUsersLocally(BuildContext context) async {
  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/users.json');
  final body = json.decode(data);
  return body.map<Al>(Al.fromJson).toList();
}

Future<Al> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.first.org/data/v1/news'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Al.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
// class UsersApi {
//   static Future<List<Datum>> getUsers() async {
//     final url =
//         'https://api.first.org/data/v1/news';
//     final response = await http.get(Uri.parse(url));
//     final body = json.decode(response.body);
//
//     return body.map<Datum>(Datum.fromJson).toList();
//   }
// }
