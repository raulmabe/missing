import './tabsUtils.dart';
import 'package:flutter/material.dart';
import './profile/profilePage.dart';
import './chats/chatsPage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import './homePage_vm.dart';
import '../../themeData.dart';
import '../../models/appTypes.dart';
import 'package:flutter/cupertino.dart';
import './others/body.dart';

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

  AppTabs selectedTab;
  List<AppTabs> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      AppTabs.PEOPLE,
      AppTabs.PETS,
      AppTabs.ITEMS,
      AppTabs.CHATS,
      AppTabs.PROFILE,
    ];
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.index = 2;
    _tabController.addListener(() {
      setState(() {
        selectedTab = tabs[_tabController.index];
      });
    });
    selectedTab = tabs[2];
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
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).canvasColor,
          systemNavigationBarIconBrightness: Brightness.dark));
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
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[
              OthersBody(
                type: AppTypes.PEOPLE,
                viewModel: widget.viewModel,
              ),
              OthersBody(
                type: AppTypes.PETS,
                viewModel: widget.viewModel,
              ),
              OthersBody(
                type: AppTypes.ITEMS,
                viewModel: widget.viewModel,
              ),
              ChatsPage(),
              ProfilePage()
            ],
          ),
          backgroundColor: Theme.of(context).canvasColor,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              // scroll to top!
              setState(() {
                _tabController.animateTo(index);
              });
            },
            currentIndex: _tabController.index,
            items: tabs.map((tab) {
              return BottomNavigationBarItem(
                  icon: selectedTab == tab
                      ? Icon(
                          getIconFromTab(tab),
                          color: getColorFromTab(context, tab),
                        )
                      : Icon(getIconFromTab(tab),
                          color: getColorFromTab(context, tab).withOpacity(.4)),
                  title: Text(getTitleFromTab(tab),
                      style: TextStyle(
                        color: getColorFromTab(context, tab),
                      )));
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