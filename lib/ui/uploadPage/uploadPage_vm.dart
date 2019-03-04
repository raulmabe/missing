import '../../models/card.dart';
import '../../models/appState.dart';
import 'package:redux/redux.dart';
import '../../redux/actions.dart';
import '../../models/appTypes.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:typed_data';

class ViewModel {
  final Function(TempCardModel) onAddCard;

  ViewModel({this.onAddCard});

  factory ViewModel.create(Store<AppState> store) {
    _OnAddCard(TempCardModel card) {
      store.dispatch(AddCard(card: CardModel((b) => b
      ..id = card.id
        ..images.addAll(card.images.map((list) => BuiltList(Uint8List.fromList(list))))
        ..type= card.type
        ..missing= card.missing
        ..title= card.title
        ..location= card.location
        ..tags.addAll(card.tags)
        ..description= card.description
        ..createdTime = DateTime.now()
      )));
    }

    return ViewModel(onAddCard: _OnAddCard);
  }
}

class TempCardModel{
  List<List<int>> images = [];
  int id;
  AppTypes type;
  bool missing;
  String title;
  String description;
  String location;
  List<String> tags = [];

  TempCardModel();
}