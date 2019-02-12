import '../widgets/missingCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import '../profilePage/profilePage.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import './homePage_vm.dart';
import '../../themeData.dart';
import '../../models/appTypes.dart';
import '../../utils/iconTypes.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  final ViewModel viewModel;

  HomePage({this.viewModel});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  IconData selectedTab;
  List<IconData> tabs;

  FocusNode focusNodeSearchBar;

  TextEditingController searchTextController;
  AnimationController iconController;

  @override
  void initState() {
    super.initState();

    tabs = [
      getTypeIcon(AppTypes.PEOPLE),
      getTypeIcon(AppTypes.PETS),
      getTypeIcon(AppTypes.ITEMS),
    ];
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.index = 2;
    _tabController.addListener(() {
      setState(() {
        selectedTab = tabs[_tabController.index];
      });
    });
    selectedTab = tabs[2];

    _scrollController = ScrollController();

    focusNodeSearchBar = FocusNode();
    focusNodeSearchBar.addListener(() {
      if (focusNodeSearchBar.hasFocus) {
        iconController.forward();
      } else
        iconController.reverse();
    });
    searchTextController = TextEditingController();
    iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final page = ModalRoute.of(context);
  page.didPush().then((x) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).canvasColor,
        systemNavigationBarIconBrightness: Brightness.dark
      )
    );
  });

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          endDrawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                    child: Text("R"),
                  ),
                  accountEmail: Text("raulmateob@gmail.com"),
                  accountName: Text("Raul Mateo"),
                ),
              ],
            ),
          ),
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, boxIsScrolled) {
              return [
                SliverAppBar(
                  brightness: Brightness.light,
                  backgroundColor: Colors.transparent,
                  forceElevated: boxIsScrolled,
                  floating: true,
                  snap: true,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          disabledColor: Theme.of(context).iconTheme.color,
                          onPressed: null,
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchTextController,
                            autocorrect: false,
                            focusNode: focusNodeSearchBar,
                            decoration:
                                InputDecoration.collapsed(hintText: "Search"),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            return Transform.rotate(
                              angle: math.pi,
                              child: IconButton(
                                icon: AnimatedIcon(
                                  icon: AnimatedIcons.menu_close,
                                  progress: iconController,
                                ),
                                color: Theme.of(context).iconTheme.color,
                                onPressed: () {
                                  if (focusNodeSearchBar.hasFocus) {
                                    searchTextController.clear();
                                    focusNodeSearchBar.unfocus();
                                  } else if (iconController.status ==
                                      AnimationStatus.dismissed)
                                    Scaffold.of(context).openEndDrawer();
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  actions: [Container()],
                ),
              ];
            },
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                buildGrid(AppTypes.PEOPLE),
                buildGrid(AppTypes.PETS),
                buildGrid(AppTypes.ITEMS),
              ],
            ),
          ),
          backgroundColor: MyTheme.of(context).kBackground,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index == _tabController.index)
                _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut);
              setState(() {
                _tabController.animateTo(index);
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _tabController.index,
            items: tabs.map((data) {
              return BottomNavigationBarItem(
                  icon: selectedTab == data
                      ? Icon(
                          data,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(data, color: Colors.grey),
                  title: Container());
            }).toList(),
          )),
    );
  }

  StaggeredGridView buildGrid(AppTypes type) {
    List cards;

    switch (type) {
      case AppTypes.ITEMS:
        cards = widget.viewModel.itemsCards;
        break;
      case AppTypes.PEOPLE:
        cards = widget.viewModel.peopleCards;
        break;
      case AppTypes.PETS:
        cards = widget.viewModel.petsCards;
        break;
      default:
        cards = [];
    }

    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      padding: EdgeInsets.all(10),
      itemCount: cards.length,
      itemBuilder: (context, index) => MissingCard(
            card: cards[index],
          ),
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      staggeredTileBuilder: (_) => StaggeredTile.fit(2),
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
