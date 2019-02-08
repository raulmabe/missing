import '../../models/card.dart';
import '../../models/appState.dart';
import 'package:redux/redux.dart';
import '../../models/appTypes.dart';
import '../../redux/actions.dart';

class ViewModel {
  final List<CardModel> cards;

  // final Function(AppType) getCardsByType;

  // final Function() refreshCards;

  ViewModel({this.cards});

  factory ViewModel.create(Store<AppState> store) {


    _refreshCards(){
      store.dispatch(GetCards());
    }

    return ViewModel(cards: store.state.cards.asList(), );
  }
}