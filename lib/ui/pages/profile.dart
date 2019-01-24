import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/uploadCard.dart';
import './chatsPage.dart';
import '../../viewModels/cardViewModel.dart';
import 'package:flutter/cupertino.dart';
import '../../viewModels/userViewModel.dart';

class Profile extends StatelessWidget {
  final UserViewModel user;

  Profile({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/map.jpg"),
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor, BlendMode.softLight),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SafeArea(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () => print("Settings"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 140.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white.withAlpha(230),
                elevation: 2.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0, -40),
                      child: Material(
                        shadowColor: Theme.of(context).primaryColor,
                        elevation: 20.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundImage: user.image,
                          radius: 50.0,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -10),
                      child: Text(user.name,
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text(user.location,
                        style: TextStyle(
                            fontFamily: "Quicksand",
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300)),
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
                                      color: Colors.grey[800],
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w200)),
                              Text(user.founds.toString(),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w200)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("missings".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w200)),
                              Text(user.missings.toString(),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w200)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Posts",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600)),
        ),
        Expanded(
          child: StaggeredGridView.count(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            crossAxisCount: 4,
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 10.0,
            children: []
              ..add(UploadCard())
              ..addAll(cardsMockUps().getRange(0, 2)),
            staggeredTiles: ([]
                  ..add(UploadCard())
                  ..addAll(cardsMockUps().getRange(0, 2)))
                .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                .toList(),
          ),
        ),
      ],
    );
  }
}
