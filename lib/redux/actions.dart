import '../models/model.dart';
import 'dart:math';
import '../utils/appType.dart';

class AddCard {
  final CardModel card;

  AddCard({this.card}){
    this.card.copyWith(id: new Random().nextInt(4294967296));
    print("Card added:");
    print(" Id: ${card.id}");
    print(" Type: ${card.type}");
    print(" Missing: ${card.missing}");
    print(" Title: ${card.title}");
    print(" Description: ${card.description}");
    print(" Location: ${card.location}");
    print(" Tags: ${card.tags}");
    print(" Images count: ${card.images.length}");
  }
}

class CardsByType {
  final AppType type;
  CardsByType({this.type});
}

class DeleteCard {
  final CardModel card;

  DeleteCard({this.card});
}