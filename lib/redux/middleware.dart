import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './auth/auth_actions.dart';
import './auth/auth_middleware.dart';
import './actions.dart';
import '../models/appState.dart';
import 'package:built_collection/built_collection.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = state.toJson();
  print("Card to JSON: $string");
  await prefs.setString("cardsState", string);
}

Future<AppState> resetPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return AppState();
}

Future<AppState> loadFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = prefs.getString("cardsState");
  if (string == null) return AppState();
  print('Card from JSON: $string');
  AppState appState = AppState.fromJson(string);
  return appState;
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  if (action is AddCard || action is DeleteCard) {
    //saveToPrefs(store.state);
  }

  if (action is GetCards) {
    // await loadFromPrefs().then((state) => store.dispatch(LoadedCards(state.cards.asList())));
  }

  if (action is UserLoginRequest) {
    store.dispatch(UpdateStatus("Checking if user exists"));
    await Future.delayed(Duration(seconds: 1));
    store.dispatch(UpdateStatus("Pursuing dogs"));
    checkIfUserExists(action.email, action.password).then((success) {
      action.completer.complete(success);
      !success
          ? store.dispatch(UserLoginFailure("Username or password incorrects"))
          : store.dispatch(UserLoginSuccess());
    });
  }
}
