
import '../models/card.dart';
import 'dart:math';
import '../models/cardStatus.dart';
import '../models/appTypes.dart';

int id = 0;

List<CardModel> getFakeCards(int x, AppTypes type){
  return List.generate(x, (i) => CardModel((b) => b
  ..title = "Item $i"
  ..description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
  ..missing = Random().nextBool()
  ..type =  type
  ..id = id++
  ..images.addAll([])
  ..location = "Premia de Mar, Barcelona"
  ..tags.addAll(List.generate(5, (j) => "tag $j"))
  ..createdTime = DateTime.now()
  ..status = CardStatus.APPROVED
  ));
}