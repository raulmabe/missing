import '../../models/card.dart';
import '../../models/appState.dart';
import 'package:redux/redux.dart';
import '../../redux/actions.dart';
import 'package:flutter/material.dart';
import './homePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/appTypes.dart';


class HomePageBuilder extends StatelessWidget {
  const HomePageBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (store) => ViewModel.create(store),
      builder: (context, viewModel) {
        return HomePage(viewModel: viewModel);
      },
    );
  }
}

class ViewModel {
  final List<CardModel> peopleCards;
  final List<CardModel> petsCards;
  final List<CardModel> itemsCards;


  // final Function() refreshCards;

  ViewModel({this.peopleCards, this.itemsCards, this.petsCards});

  factory ViewModel.create(Store<AppState> store) {

    // _refreshCards(){
    //   store.dispatch(GetCards());
    // }

    return ViewModel(
      peopleCards: store.state.peopleCards.asList(), 
      petsCards: store.state.petsCards.asList(),  
      itemsCards: store.state.itemsCards.asList(),
    );
  }
}