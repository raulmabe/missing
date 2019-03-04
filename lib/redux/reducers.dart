import '../models/card.dart';
import '../models/appState.dart';
import './actions.dart';
import '../models/appTypes.dart';
import './auth/auth_actions.dart';
import '../models/user.dart';
import 'package:built_collection/built_collection.dart';

// General reducer
AppState appStateReducer(AppState prev, action) {
  if (action is LoadedState) return action.state;
  return AppState().rebuild((b) => b
    ..peopleCards = ListBuilder(cardReducer(prev.peopleCards.asList(), action, AppTypes.PEOPLE))
    ..petsCards = ListBuilder(cardReducer(prev.petsCards.asList(), action, AppTypes.PETS))
    ..itemsCards = ListBuilder(cardReducer(prev.itemsCards.asList(), action, AppTypes.ITEMS))
    ..isLoading = loadingReducer(prev.isLoading, action)
    ..authState.status = statusReducer(prev.authState.status, action)
    ..authState.user = userReducer(prev.authState.user, action).toBuilder()
    );
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

bool loadingReducer(bool prev, action) {
  if (action is StartLoading) return true;
  if (action is StopLoading) return false;
  return prev;
}

String statusReducer(String prev, action) {
  if (action is UpdateStatus) return action.status;
  return prev;
}

UserModel userReducer(UserModel prev, action) {
  if (action is UserLoginSuccess) return action.user;
  return prev;
}