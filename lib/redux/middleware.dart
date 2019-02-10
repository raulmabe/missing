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
    print("Card gotten:");
    print(" Id: ${action.card.id}");
    print(" Type: ${action.card.type}");
    print(" Missing: ${action.card.missing}");
    print(" Title: ${action.card.title}");
    print(" Description: ${action.card.description}");
    print(" Location: ${action.card.location}");
    print(" Tags: ${action.card.tags}");
    print(" Images count: ${action.card.images.length}");
    print("CARDS: ${store.state.cards.length}");
    saveToPrefs(store.state);
  }

  if (action is GetCards) {
    await resetPrefs().then((state) => store.dispatch(LoadedState(state: state)));
    // await loadFromPrefs().then((state) => store.dispatch(LoadedCards(state.cards.asList())));
  }

  if (action is UserLoginRequest) {
    checkIfUserExists(action.email, action.password).then((success) {
      action.completer.complete(success);
      !success
          ? store.dispatch(UserLoginFailure("Username or password incorrects"))
          : store.dispatch(UserLoginSuccess());
    });
  }
}
