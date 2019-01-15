import 'package:flutter/material.dart';
import './body.dart';
import './profileBody.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/searchBar.dart';

class HomePage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _HomePageState();
    }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
    _scrollController = ScrollController();
  }

  void _handleTabSelection(){
    setState((){});
  }

  @override
  void dispose(){
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            TabBarView(
              controller: _tabController,
              children: <Widget>[
                new Body(
                  type: Type.PEOPLE,
                ),
                new Body(
                  type: Type.PETS,
                ),
                new Body(
                  type: Type.THINGS,
                ),
                new ProfileBody(),
              ],
            ),
            (_tabController.index == _tabController.length-1) ? new Container() : Positioned(
              top: 4.0,
              right: 20.0,
              left: 20.0,
              child: SafeArea(
                child: SearchBar(),
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: new Container(
        padding: EdgeInsets.only(bottom: 20.0),
        color: Theme.of(context).primaryColor,
        height: 85,
        child: new TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicator: null,
          tabs: <Widget>[
            Tab(
              text: "People",
              icon: new Icon(Icons.face),
            ),
            Tab(
              text: "Pets",
              icon: new Icon(Icons.pets),
            ),
            Tab(
              text: "Things",
              icon: new Icon(FontAwesomeIcons.archive),
            ),
            Tab(
              text: "Profile",
              icon: new Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
