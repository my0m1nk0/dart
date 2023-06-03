// ignore_for_file: invalid_return_type_for_catch_error

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'User.dart';

var url = Uri.https("randomuser.me", "/api/?results=50");

void main() async {
  await http.get(url).then((res) {
    var decodedData = jsonDecode(res.body)["results"];
    List<dynamic> lisy = decodedData as List;
    List<User> users = lisy.map((e) => User.from(e)).toList();
    users.forEach((user) => print(user.picture?.thumbnail));
  }).catchError((e) => print(e));
}
