import '../models/card.dart';
import '../models/appState.dart';
import './actions.dart';
import '../models/appTypes.dart';
import 'package:built_collection/built_collection.dart';

// General reducer
AppState appStateReducer(AppState prev, action) {
  if (action is LoadedState) return action.state;
  return AppState().rebuild((b) => b
    ..peopleCards = ListBuilder(cardReducer(prev.peopleCards.asList(), action, AppTypes.PEOPLE))
    ..petsCards = ListBuilder(cardReducer(prev.petsCards.asList(), action, AppTypes.PETS))
    ..itemsCards = ListBuilder(cardReducer(prev.itemsCards.asList(), action, AppTypes.ITEMS))
    ..isLoading = loadingReducer(action));
}

// More specific reducers:
List<CardModel> cardReducer(List<CardModel> prev, action, AppTypes type) {

  if (action is AddCard && action.card.type == type) {
    return []
      ..addAll(prev)
      ..add(action.card);
  }
  if (action is DeleteCard  && action.card.type == type) {
    return List.unmodifiable(List.from(prev))..remove(action.card);
  }

  if (action is LoadedCards && action.cards.first.type == type) {
    return action.cards;
  }

  return prev;
}

bool loadingReducer(action) {
  if (action is StartLoading) return true;
  if (action is StopLoading) return false;
  return false;
}
