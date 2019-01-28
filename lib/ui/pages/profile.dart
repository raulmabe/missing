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
        Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(FontAwesomeIcons.slidersH),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
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
                      IconButton(
                        icon: Icon(Icons.send),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600)),
                  Text(user.location,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300)),
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
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200)),
                            Text(user.founds.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w200)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("missings".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200)),
                            Text(user.missings.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w200)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
