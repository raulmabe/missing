import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/serializers.dart';
import './actions.dart';
import '../models/appState.dart';
import 'package:built_collection/built_collection.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = state.toJson();
  print("Card to JSON: $string");
  await prefs.setString("cardsState", string);
}

Future<AppState> loadFromPrefs() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var string = prefs.getString("cardsState");
  if(string == null) return AppState((b) => b.peopleCards = b.petsCards = b.thingsCards = ListBuilder([]));
  print('Card from JSON: $string');
  AppState appState = AppState.fromJson(string);
  return appState;
}

void appStateMiddleware(Store<AppState> store, action, NextDispatcher next) async{
  next(action);
   
  if(action is AddCard
    ||  action is DeleteCard){

     print("Card gotten:");
     print(" Id: ${action.card.id}");
     print(" Type: ${action.card.type}");
     print(" Missing: ${action.card.missing}");
     print(" Title: ${action.card.title}");
     print(" Description: ${action.card.description}");
     print(" Location: ${action.card.location}");
     print(" Tags: ${action.card.tags}");
     print(" Images count: ${action.card.images.length}");
      saveToPrefs(store.state);
    }

    if(action is GetCards){
      await loadFromPrefs().then((state) => store.dispatch(LoadedCards(
        peopleCards: state.peopleCards.asList(),
        petsCards: state.petsCards.asList(),
        thingsCards: state.thingsCards.asList(),
        )));
    }
}