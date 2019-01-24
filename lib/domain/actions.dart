import 'dart:async';
import '../viewModels/cardViewModel.dart';
import '../ui/widgets/missingCards.dart';

void addCard(CardViewModel card) {
  list.insert(0, MissingCard(card: card,));
}

CardViewModel getSideCard(int id, bool next){
  if(next) return list[id+1].card;
  return list[id-1].card;
}

void sharePost() async {
  print("Sharing post");
}
