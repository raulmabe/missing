import '../../utils/globalUtils.dart';
import 'package:flutter/material.dart';
import './profile/profilePage.dart';
import './profile/profilePage_vm.dart';
import './chats/chatsPage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import './homePage_vm.dart';
import '../../themeData.dart';
import '../../models/appTypes.dart';
import 'package:flutter/cupertino.dart';
import './others/body.dart';
import 'dart:ui' as ui;

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: SizedBox(
                      height: 100,
                    ),
                    decoration: BoxDecoration(),
                  ),
                  ListTile(
                    onTap: () => print("Settings"),
                    leading: Icon(Icons.settings,
                    color: Colors.grey.shade700),
                    title: Text("Settings", 
                    style: Theme.of(context).textTheme.headline.copyWith(
                      color: Colors.grey.shade700
                    ),),
                  ),
                  ListTile(
                    onTap: () => print("log out"),
                    leading: Icon(Icons.exit_to_app,
                    color: Colors.grey.shade700),
                    title: Text("Log out", 
                    style: Theme.of(context).textTheme.headline.copyWith(
                      color: Colors.grey.shade700
                    ),),
                  )

                ],
              ),
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
              ProfileBuilder()
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
                      ? ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              Offset(0.0, 24.0),
                              Offset(24.0, 0.0),
                              [
                                MyTheme.of(context).kBlue,
                                MyTheme.of(context).kGreen,
                              ],
                            );
                          },
                          child: Icon(
                            getIconFromTab(tab),
                          ),
                        )
                      : Icon(getIconFromTab(tab), color: Colors.grey.shade400),
                  title: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return ui.Gradient.linear(
                          Offset(0.0, 24.0),
                          Offset(24.0, 0.0),
                          [
                            MyTheme.of(context).kBlue,
                            MyTheme.of(context).kGreen,
                          ],
                        );
                      },
                      child: Text(
                        getTitleFromTab(tab),
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
