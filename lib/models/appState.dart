import 'package:flutter/foundation.dart';
import './card.dart';

class AppState{
  List<CardModel> cards;

  AppState({
    @required this.cards
  });

  AppState.initialState() : cards = List.unmodifiable(<CardModel>[]);

  AppState.fromJson(Map json)
    : cards = (json["cards"] as List).map(
      (i) => CardModel.fromJson(i)
    ).toList();

    Map toJson()=>{"cards" : cards};
}