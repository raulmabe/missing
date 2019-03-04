import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user.dart';

final String baseURI = "http://192.168.1.33:8888";

Future<UserModel> login(String email, String password) async {
  final resp = await http.post(baseURI + '/login.php',
      body: {"email": email.trim(), "password": password});

  if (resp != null) {
    try {
      var data = json.decode(resp.body);
      if (resp.statusCode == 200 && data.length != 0) {
        return UserModel.fromJson(resp.body);
      } else return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
