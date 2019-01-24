import 'package:flutter/material.dart';
import './firstBody.dart';
import './secondBody.dart';
import '../../../themeData.dart';
import 'dart:async';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    tabs = [
      FirstBody(),
      SecondBody(),
    ];
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            disabledColor: Colors.white,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: (_tabController.index == 0)
                ? () => Navigator.pop(context)
                : null,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: tabs,
        ),
        bottomNavigationBar: Container(
          height: 100.0,
          child: SafeArea(
            child: Builder(builder: (context) {
              VoidCallback callBack1 = null;
              VoidCallback callBack2 = null;

              if (_tabController.index == 0) {
                callBack2 = () {
                  setState(() {
                    _tabController.animateTo(_tabController.index + 1);
                  });
                };
              } else if (_tabController.index == tabs.length - 1) {
                callBack1 = () {
                  setState(() {
                    _tabController.animateTo(_tabController.index - 1);
                  });
                };
              } else {
                callBack1 = () {
                  setState(() {
                    _tabController.animateTo(_tabController.index - 1);
                  });
                };
                callBack2 = () {
                  setState(() {
                    _tabController.animateTo(_tabController.index + 1);
                  });
                };
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).primaryColor,
                    disabledColor: Colors.white,
                    onPressed: callBack1,
                  ),
                  TabPageSelector(
                    controller: _tabController,
                    color: Colors.black26,
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    disabledColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: callBack2,
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_tabController.index != 0) {
      setState(() {
        _tabController.animateTo(_tabController.index - 1);
      });
      return false;
    } else
      return true;
  }
}
