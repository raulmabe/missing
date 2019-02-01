import '../models/model.dart';
import './actions.dart';

// General reducer
AppState appStateReducer(AppState prev, action){
  return AppState(
    cards: cardReducer(prev.cards, action)
  );
}

// More specific reducers:
List<CardModel> cardReducer(List<CardModel> prev, action){
  if(action is AddCard){
    return []..addAll(prev)..add(action.card);
  }
  if(action is DeleteCard){
    return List.unmodifiable(List.from(prev))..remove(action.card);
  }

  return prev;
}