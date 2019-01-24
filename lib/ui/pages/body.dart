import 'package:flutter/material.dart';
import '../../viewModels/cardViewModel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/rendering.dart';
import '../../types.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

typedef onScrollVoid = void Function(ScrollDirection); 

class Body extends StatefulWidget{

  final AppType type;
  final onScrollVoid onScroll;

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

  _BodyState(this.type, this.onScroll);

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
    if(type == AppType.PEOPLE){  //children.length == 0) {
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
      child: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        color: Theme.of(context).primaryColor,
        springAnimationDurationInMilliseconds: 500,
        backgroundColor: Colors.white,
        onRefresh: _handleUpdate,
              child: StaggeredGridView.count(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics (),
          padding: EdgeInsets.only(top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
          crossAxisCount: 4,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 10.0,
          children: cardsMockUps(),
          staggeredTiles: cardsMockUps()
                        .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                        .toList(),
        ),
      ),
    );
  }

  Future<void> _handleUpdate() async{
    print("Updating");
    await Future.delayed(Duration(seconds: 3));
  }
}