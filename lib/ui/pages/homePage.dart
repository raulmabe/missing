import 'package:flutter/material.dart';
import './body.dart';
import './profileBody.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/searchBar.dart';

class HomePage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _HomePageState();
    }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection(){
    setState((){});
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        height: 100,
        child: SafeArea(
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "People",
                icon: Icon(Icons.face),
              ),
              Tab(
                text: "Pets",
                icon: Icon(Icons.pets),
              ),
              Tab(
                text: "Things",
                icon: Icon(FontAwesomeIcons.archive),
              ),
              Tab(
                text: "Profile",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
