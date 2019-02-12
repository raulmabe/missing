import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/uploadCard.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
                    child: Material(
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile_pic.jpg"),
                radius: MediaQuery.of(context).size.width * .1,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Raul Mateo Beneyto",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          20.0 * MediaQuery.of(context).textScaleFactor, // ! TEST
                      fontWeight: FontWeight.w600)),
              Text("Premià de Mar, Barcelona",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("found".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w200)),
                        Text(2.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w200)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("missings".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w200)),
                        Text(3.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w200)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.hasBoundedWidth) {
                return StaggeredGridView.count(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 10.0,
                  children: []..add(UploadCard()),
                  //..addAll(cardsMockUps().getRange(0, 2)),
                  staggeredTiles: ([]..add(UploadCard()))
                      //..addAll(cardsMockUps().getRange(0, 2)))
                      .map<StaggeredTile>((_) => StaggeredTile.fit(1))
                      .toList(),
                );
              } else {
                return StaggeredGridView.count(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  crossAxisCount: 4,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 10.0,
                  children: []..add(UploadCard()),
                  //..addAll(cardsMockUps().getRange(0, 2)),
                  staggeredTiles: ([]..add(UploadCard()))
                      //..addAll(cardsMockUps().getRange(0, 2)))
                      .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                      .toList(),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
