import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/serializers.dart';
import '../../models/auth/authState.dart';
import '../actions.dart';
import '../../models/appState.dart';
import 'package:built_collection/built_collection.dart';
import './auth_actions.dart';
import 'package:http/http.dart' as http;

Future<bool> checkIfUserExists(String email, String password) async{
  fetchData();
  await Future.delayed(Duration(seconds: 4));
  return true;
}

void fetchData() async {
    final response = await http.get('http://192.168.43.203:8888/fetch_data.php');
    if (response.statusCode == 200) {
        print(json.decode(response.body));
    } else print("Error: ${response.statusCode}");
  }