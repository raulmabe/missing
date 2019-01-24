import 'dart:async';
import '../viewModels/cardViewModel.dart';
import '../ui/widgets/missingCards.dart';

void addCard(CardViewModel card) {
  list.insert(0, MissingCard(card: card,));
}

void sharePost() async {
  print("Sharing post");
}
