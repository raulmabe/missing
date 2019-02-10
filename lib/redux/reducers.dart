import '../models/card.dart';
import '../models/appState.dart';
import './actions.dart';

// General reducer
AppState appStateReducer(AppState prev, action) {
  if (action is LoadedState) return action.state;
  return AppState().rebuild((b) => b
    ..cards.addAll(cardReducer(prev.cards.asList(), action))
    ..isLoading = loadingReducer(action));
}

// More specific reducers:
List<CardModel> cardReducer(List<CardModel> prev, action) {
  if (action is AddCard) {
    return []
      ..addAll(prev)
      ..add(action.card);
  }
  if (action is DeleteCard) {
    return List.unmodifiable(List.from(prev))..remove(action.card);
  }

  if (action is LoadedCards) {
    return action.cards;
  }

  return prev;
}

bool loadingReducer(action) {
  if (action is StartLoading) return true;
  if (action is StopLoading) return false;
  return false;
}
