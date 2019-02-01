import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './actions.dart';
import '../models/appState.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await prefs.setString("cardsState", string);
  
  print("Saved ${state.cards.length} cards");
}

Future<AppState> loadFromPrefs() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = prefs.getString("cardsState");
  if(string == null) return AppState.initialState();
  
  Map map = json.decode(string);
  return AppState.fromJson(map);
}

void appStateMiddleware(Store<AppState> store, action, NextDispatcher next) async{
  if(action is AddCard
    ||  action is DeleteCard){
      print("CARDS: ${store.state.cards.length}");
      saveToPrefs(store.state);
    }

    if(action is GetCards){
      await loadFromPrefs().then((state) => store.dispatch(LoadedCards(state.cards)));
    }
}