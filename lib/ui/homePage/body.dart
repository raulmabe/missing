import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/rendering.dart';
import '../../models/appTypes.dart';
import './homePage_vm.dart';
import '../widgets/missingCard.dart';

typedef onScrollVoid = void Function(ScrollDirection);

class Body extends StatefulWidget {
  final AppTypes type;
  final onScrollVoid onScroll;
  final ViewModel viewModel;

  Body({@required this.type, this.onScroll, this.viewModel});

  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    // Save offset to Redux state
    widget.onScroll(_scrollController.position.userScrollDirection);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        backgroundColor: Theme.of(context).primaryColor,
        color: Colors.white,
        onRefresh: _handleUpdate,
        child: StaggeredGridView.count(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding:
              EdgeInsets.only(top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
          crossAxisCount: 4,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 10.0,
          children: widget.viewModel.cards
              .map((card) => MissingCard(
                    card: card,
                  ))
              .toList(),
          staggeredTiles: widget.viewModel.cards
              .map((card) => MissingCard(
                    card: card,
                  ))
              .toList()
              .map<StaggeredTile>((_) => StaggeredTile.fit(2))
              .toList(),
        ),
      ),
    );
  }

  Future<void> _handleUpdate() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
