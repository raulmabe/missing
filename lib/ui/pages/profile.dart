import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/uploadCard.dart';
import './chatsPage.dart';
import '../../viewModels/cardViewModel.dart';
import 'package:flutter/cupertino.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {

  ScrollController _scrollController;


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
      /* decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topLeft,
          colors: [
            Theme.of(context).primaryColor,
            MyTheme.of(context).kSecondaryLight
          ]
        )
      ), */
      color: Colors.white,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ChatsPage(),
                        ),
                      );
                    },
                    splashColor: Theme.of(context).splashColor,
                    icon: Icon(
                      Icons.chat,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                      ),
                    ),
                    IconButton(
                    onPressed: (){print("Settings tapped");},
                    splashColor: Theme.of(context).splashColor,
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                      ),
                    ),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Profile image
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(
                  child: StaggeredGridView.count(
                    controller: _scrollController,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                    crossAxisCount: 4,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 10.0,
                    children: []..add(UploadCard())..addAll(cardsMockUps().getRange(0, 2)),
                    staggeredTiles: ([]..add(UploadCard())..addAll(cardsMockUps().getRange(0, 2)))
                                  .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                                  .toList(),
                  ),
                ), 
              ],
            ),
          ),
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
            color: Theme.of(context).primaryColor
          )
          ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Theme.of(context).primaryColor
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
                    color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
                ),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  "Premià de mar, Barcelona",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor
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

