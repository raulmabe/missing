import './appTypes.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';
import './serializers.dart';

part 'card.g.dart';

abstract class CardModel implements Built<CardModel, CardModelBuilder>{

  @nullable
  BuiltList<BuiltList<int>> get images;

  int get id;

  AppTypes get type;

  bool get missing;

  String get title;

  String get description;

  String get location;

  BuiltList<String> get tags;

  CardModel._();
  factory CardModel([updates(CardModelBuilder b)]) = _$CardModel;
  
  static Serializer<CardModel> get serializer => _$cardModelSerializer;



  String toJson(){
    return json.encode(serializers.serializeWith(CardModel.serializer, this));
  }

  static CardModel fromJson(String jsonString){
    return serializers.deserializeWith(CardModel.serializer, json.decode(jsonString));
  }

}
