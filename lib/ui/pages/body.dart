import 'package:flutter/material.dart';
import '../widgets/missingCards.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/rendering.dart';
import '../../types.dart';

typedef onScrollVoid = void Function(ScrollDirection); 

class Body extends StatefulWidget{

  AppType type;
  onScrollVoid onScroll;

  Body({@required this.type, this.onScroll});

  @override
    State<StatefulWidget> createState() {
      return _BodyState(type, onScroll);
    }
}

class _BodyState extends State<Body>{

  AppType type;

  ScrollController _scrollController;
  onScrollVoid onScroll;

  List<Widget> children;

  _BodyState(this.type, this.onScroll){
    children = [];
    if(type != AppType.PEOPLE){
      for(int i = 0; i < 100; ++i){
        children.add(new MissingCard(
          id: i,
          title: null,
          description: null,
          tags: null,
          type: type,
        ));
      }
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
    onScroll(_scrollController.position.userScrollDirection);
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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