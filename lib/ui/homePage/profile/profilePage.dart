import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../widgets/uploadCard.dart';
import 'package:flutter/cupertino.dart';
import '../tabsUtils.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, boxIsScroled) {
          return <Widget>[
            SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Theme.of(context).canvasColor,
              pinned: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  color: getColorFromTab(context, AppTabs.PROFILE),
                ),
              ],
              expandedHeight: MediaQuery.of(context).size.height / 3,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile_pic.jpg"),
                      radius: 50,
                    ),
                    Text("Raul Mateo Beneyto",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0 *
                                MediaQuery.of(context)
                                    .textScaleFactor, // ! TEST
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
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: StaggeredGridView.count(
          physics: AlwaysScrollableScrollPhysics(),
          padding:
              EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
          crossAxisCount: 4,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 10.0,
          children: []..add(UploadCard()),
          staggeredTiles: ([]..add(UploadCard()))
              .map<StaggeredTile>((_) => StaggeredTile.fit(2))
              .toList(),
        ));
  }
}