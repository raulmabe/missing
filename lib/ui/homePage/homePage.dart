import 'package:flutter/material.dart';
import './body.dart';
import './profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/searchBar.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import '../../models/model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../themeData.dart';
import '../../utils/appType.dart';

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
          body: StoreConnector<AppState, ViewModel>(
            converter: (store) => ViewModel.create(store),
            builder: (context, viewModel) => Stack(
                  children: <Widget>[
                    TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: <Widget>[
                        Body(
                          type: AppType.values[0],
                          onScroll: onScroll,
                          viewModel: viewModel,
                        ),
                        Body(
                          type: AppType.values[1],
                          onScroll: onScroll,
                          viewModel: viewModel,
                        ),
                        Body(
                          type: AppType.values[2],
                          onScroll: onScroll,
                          viewModel: viewModel,
                        ),
                        Profile(),
                      ],
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
          ),
          backgroundColor: MyTheme.of(context).kBackground,
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
                                Theme.of(context).primaryColor,
                                Theme.of(context).primaryColorLight,
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

class ViewModel {
  final List<CardModel> cards;

  ViewModel({this.cards});

  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(cards: store.state.cards);
  }
}
