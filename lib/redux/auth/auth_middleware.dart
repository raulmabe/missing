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

Future<bool> checkIfUserExists(String email, String password) async{
  await Future.delayed(Duration(seconds: 4));
  return true;
}
