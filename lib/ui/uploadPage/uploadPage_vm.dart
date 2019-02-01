import '../../models/card.dart';
import '../../models/appState.dart';
import 'package:redux/redux.dart';
import '../../redux/actions.dart';
import '../../utils/appType.dart';

class ViewModel {
  final Function(TempCardModel) onAddCard;

  ViewModel({this.onAddCard});

  factory ViewModel.create(Store<AppState> store) {
    _OnAddCard(TempCardModel card) {
      store.dispatch(AddCard(card: CardModel(
        id: card.id,
        images: card.images ?? [],
        type: card.type,
        missing: card.missing,
        title: card.title,
        location: card.location,
        tags: card.tags,
        description: card.description
      )));
    }

    return ViewModel(onAddCard: _OnAddCard);
  }
}

class TempCardModel{
  List images = [];
  int id;
  AppType type;
  bool missing;
  String title;
  String description;
  String location;
  List<String> tags = [];

  TempCardModel();
}