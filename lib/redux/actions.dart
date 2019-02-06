import '../models/card.dart';
import 'dart:math';
import '../models/appTypes.dart';

class AddCard {
  final CardModel card;

  AddCard({this.card}){
    this.card.rebuild((b) => b.id = Random().nextInt(4294967296));
  }
}

class CardsByType {
  final AppTypes type;
  CardsByType({this.type});
}

class DeleteCard {
  final CardModel card;

  DeleteCard({this.card});
}

class GetCards{}

class LoadedCards{
  final List<CardModel> cards;
  LoadedCards(this.cards){
    print(cards.length);
  }
}