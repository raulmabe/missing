import '../types.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import '../ui/widgets/missingCards.dart';

class CardViewModel {
  List<AssetImage> images;
  int id;
  AppType type;
  bool missing;
  String title;
  String description;
  String location;
  List<String> tags;
  // int userId;

  // temporary
  double height = (new Random().nextDouble() * 100) + 100;

  CardViewModel(
      {this.images,
      this.id,
      this.missing,
      this.type,
      this.title,
      this.description,
      this.location,
      this.tags});
}


List<MissingCard> list = [];

List<MissingCard> cardsMockUps() {
  if(list.length != 0) return list;
  for (int i = 0; i < 100; ++i) {
    list.add(MissingCard(
        card: CardViewModel(
            images: [AssetImage("assets/gato${(i%3) + 1}.jpg")],
            id: 100-i,
            title: "Item",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            type: AppType.PETS,
            missing: new Random().nextBool(),
            location: "Malgrat de Mar, Barcelona",
            tags: ["gato", "claro", "canela", "pequeña"])));
  }
  return list;
}
