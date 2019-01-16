import 'package:flutter/material.dart';
import './widgets/missingCards.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Body extends StatefulWidget{

  Type type;

  Body({@required this.type});

  @override
    State<StatefulWidget> createState() {
      return _BodyState();
    }
}

class _BodyState extends State<Body>{

  ScrollController _scrollController;

  List<Widget> children = [
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
          MissingCard(
            title: null,
            description: null,
          ),
  ];

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll(){
    // Save offset to Redux state
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
        
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StaggeredGridView.count(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
        crossAxisCount: 4,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 10.0,
        children: children,
        staggeredTiles: children
                      .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                      .toList(),
      ),
    );
  }
}

enum Type{
  PETS,PEOPLE,THINGS
}