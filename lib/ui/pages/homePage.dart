import 'package:flutter/material.dart';
import './body.dart';
import './profileBody.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/searchBar.dart';
import 'package:flutter/rendering.dart';
import '../../types.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _showSearchBar = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onScroll(ScrollDirection scroll) {
    if (scroll == ScrollDirection.forward) {
      setState(() {
        _showSearchBar = true;
      });
    } else if (scroll == ScrollDirection.reverse) {
      setState(() {
        _showSearchBar = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                new Body(
                  type: AppType.values[0],
                  onScroll: onScroll,
                ),
                new Body(
                  type: AppType.values[1],
                  onScroll: onScroll,
                ),
                new Body(
                  type: AppType.values[2],
                  onScroll: onScroll,
                ),
                new ProfileBody(),
              ],
            ),
            (_tabController.index == _tabController.length - 1)
                ? new Container()
                : Positioned(
                    top: 10.0,
                    right: 20.0,
                    left: 20.0,
                    child: (_showSearchBar)
                        ? SafeArea(
                            child: SearchBar(),
                          )
                        : Container())
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: SafeArea(
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.black26,
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "People",
                  icon: Icon(Icons.face,
                  size: 20.0),
                ),
                Tab(
                  text: "Pets",
                  icon: Icon(Icons.pets,
                  size: 20.0),
                ),
                Tab(
                  text: "Things",
                  icon: Icon(FontAwesomeIcons.archive,
                  size: 20.0),
                ),
                Tab(
                  text: "Profile",
                  icon: Icon(Icons.person,
                  size: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you want to exit the app?"),
        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      )
    );
  }
}
