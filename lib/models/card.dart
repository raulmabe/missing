import 'package:flutter/foundation.dart';
import '../utils/appType.dart';


class CardModel {
  final List images;
  final int id;
  final AppType type;
  final bool missing;
  final String title;
  final String description;
  final String location;
  final List<String> tags;
  // int userId;

  CardModel(
      {this.images,
      @required this.id,
      @required this.missing,
      @required this.type,
      @required this.title,
      @required this.description,
      @required this.location,
      @required this.tags});

  CardModel copyWith({List images,
       int id,
       bool missing,
       AppType type,
       String title,
       String description,
       String location,
       List<String> tags}){
         return CardModel(
           id: id ?? this.id,
           images: images ?? this.images,
           missing: missing ?? this.missing,
           type: type ?? this.type,
           title: title ?? this.title,
           description: description ?? this.description,
           location: location ?? this.location,
           tags: tags ?? this.tags,
         );
       }

  CardModel.fromJson(Map json)
    : id = json["id"],
     title = json["title"],
     description = json["description"],
     images = json["images"],
     location = json["location"],
     missing = json["missing"],
     tags = json["tags"],
     type = json["type"];


  Map toJson() => {
    "id" : (id as int),
    "title" : title,
    "description" : description,
    "images" : images,
    "location" : location,
    "missing" : missing,
    "type" : type,
    "tags" : tags
  };
}
