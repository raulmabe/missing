import 'package:flutter/material.dart';
import '../widgets/missingCards.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

class Body extends StatefulWidget{

  Type type;

  Body({@required this.type});

  @override
    State<StatefulWidget> createState() {
      return _BodyState(type);
    }
}

class _BodyState extends State<Body>{

  Type type;

  ScrollController _scrollController;

  List<Widget> children = [
          MissingCard(
            id: 0,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 1,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 2,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 3,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 4,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 5,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 6,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 7,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 8,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 9,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 10,
            title: null,
            description: null,
          ),
          MissingCard(
            id: 11,
            title: null,
            description: null,
          ),
  ];

  _BodyState(this.type){
    if(type == Type.PEOPLE){
      children = [];
    }
  }

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
    if(children.length == 0) {
      return Center(
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Text("Fortunately, there are no ", 
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18.0
              ),
            ),
            Text("missings ",
              style: TextStyle(
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
                fontSize: 18.0
              )
            ),
            Text("at the moment. ", 
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18.0
              ),
            ),
          ],
        ),
      );
    }
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