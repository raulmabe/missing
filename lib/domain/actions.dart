import 'dart:async';
import '../viewModels/cardViewModel.dart';
import '../ui/widgets/missingCards.dart';

void addCard(CardViewModel card) {
  cards.insert(0, MissingCard(card: card,));
}

CardViewModel getSideCard(int id, bool next){
  if(next) return cards[id+1].card;
  return cards[id-1].card;
}

void sharePost() async {
  print("Sharing post");
}
