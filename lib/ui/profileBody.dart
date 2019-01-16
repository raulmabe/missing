import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/missingCards.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {

  ScrollController _scrollController;

  List<Widget> myPosts = [
    MissingCard(
      id: new Random().nextInt(1000),
      title: null,
      description: null,
    ),
    MissingCard(
      id: new Random().nextInt(1000),
      title: null,
      description: null,
    ),
  ];

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topLeft,
          colors: [
            Theme.of(context).primaryColor,
            Colors.redAccent[100]
          ]
        )
      ),
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){print("Settings tapped");},
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Profile image
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0
                      )
                  ),
                  child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_pic.jpg"),
                  radius: 50.0,
                ),
                ),
                getTextColumn(
                  number: 0,
                  text: "Found"
                ),
                getTextColumn(
                  number: 2,
                  text: "Missings"
                ),
              ],
            ),
            getInfo(),
            Divider(
              color: Colors.white,
            ),
            Expanded(
              child: StaggeredGridView.count(
                controller: _scrollController,
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 10.0,
                children: myPosts,
                staggeredTiles: myPosts
                              .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                              .toList(),
              ),
            ), 
          ],
        ),
      ),
    );
  }

  Widget getTextColumn({@required int number, @required String text}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "$number",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.grey[50]
          )
          ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.grey[50]
          )
        )
      ],
    );
  }

  Widget getInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 40,
      ),
      child: Column(
        children: <Widget>[
          // Usuario
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Raul Mateo Beneyto",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              )
            ],
          ),

          // Ubicacion
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.mapMarkerAlt,
                size: 20.0,
                color: Colors.white,
                ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Premià de mar, Barcelona",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white
                  ),
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

