import './card.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';
import './auth/authState.dart';
import './serializers.dart';
import '../stubs/cardsStub.dart';
import './appTypes.dart';

part 'appState.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<CardModel> get peopleCards;
  BuiltList<CardModel> get petsCards;
  BuiltList<CardModel> get itemsCards;


  AuthState get authState;

  bool get isLoading;

  AppState._();

  factory AppState() {
    return _$AppState._(
      isLoading: false,
      peopleCards: BuiltList.from([]),
      petsCards: BuiltList.from([]),
      itemsCards: BuiltList.from([]),
      authState: AuthState(),
    );
  }

  factory AppState.initial(){
    return _$AppState._(
      isLoading: false,
      peopleCards: BuiltList.from(getFakeCards(100, AppTypes.PEOPLE)),
      petsCards: BuiltList.from(getFakeCards(100, AppTypes.PETS)),
      itemsCards: BuiltList.from(getFakeCards(100, AppTypes.ITEMS)),
      authState: AuthState(),
    );
  }

  //factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  static Serializer<AppState> get serializer => _$appStateSerializer;

  String toJson() {
    return json.encode(serializers.serializeWith(AppState.serializer, this));
  }

  static AppState fromJson(String jsonString) {
    return serializers.deserializeWith(
        AppState.serializer, json.decode(jsonString));
  }
}
