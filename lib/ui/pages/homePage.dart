import 'package:flutter/material.dart';
import './body.dart';
import './profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/searchBar.dart';
import 'package:flutter/rendering.dart';
import '../../types.dart';
import 'dart:ui' as ui;
import '../../viewModels/userViewModel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _showSearchBar;
  List<IconData> tabs;
  List<Widget> tabsBodies;
  IconData selectedTab;

  @override
  void initState() {
    super.initState();
    _showSearchBar = true;
    tabs = [
      FontAwesomeIcons.solidIdBadge,
      FontAwesomeIcons.paw,
      FontAwesomeIcons.archive,
      FontAwesomeIcons.userAstronaut
    ];
    tabsBodies = [
      Body(
        type: AppType.values[0],
        onScroll: onScroll,
      ),
      Body(
        type: AppType.values[1],
        onScroll: onScroll,
      ),
      Body(
        type: AppType.values[2],
        onScroll: onScroll,
      ),
      Profile(
        user: user,
      ),
    ];
    assert(tabs.length == tabsBodies.length);
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.index = 2;
    selectedTab = FontAwesomeIcons.archive;
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      selectedTab = tabs[_tabController.index];
      _showSearchBar = true;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onScroll(ScrollDirection scroll) {
    if (scroll == ScrollDirection.forward && !_showSearchBar) {
      setState(() {
        _showSearchBar = true;
      });
    } else if (scroll == ScrollDirection.reverse && _showSearchBar) {
      setState(() {
        print("Changing");
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
                children: tabsBodies,
              ),
              (_tabController.index == _tabController.length - 1 ||
                      !_showSearchBar)
                  ? new Container()
                  : Positioned(
                      top: 10.0,
                      right: 20.0,
                      left: 20.0,
                      child: SafeArea(
                        child: SearchBar(),
                      )),
            ],
          ),
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _tabController.animateTo(index);
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _tabController.index,
            items: tabs.map((data) {
              return BottomNavigationBarItem(
                  icon: selectedTab == data
                      ? ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              Offset(4.0, 24.0),
                              Offset(24.0, 4.0),
                              [
                                Colors.blue[200],
                                Colors.greenAccent,
                              ],
                            );
                          },
                          child: Icon(data),
                        )
                      : Icon(data, color: Colors.grey),
                  title: Container());
            }).toList(),
          )),
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
            ));
  }
}
