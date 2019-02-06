import './card.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';
import './serializers.dart';

part 'appState.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder>{

  BuiltList<CardModel> get cards;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  static Serializer<AppState> get serializer => _$appStateSerializer;

  String toJson(){
    return json.encode(serializers.serializeWith(AppState.serializer, this));
  }

  static AppState fromJson(String jsonString){
    return serializers.deserializeWith(AppState.serializer, json.decode(jsonString));
  }

}