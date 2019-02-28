import 'package:flutter/material.dart';
import '../../loginPage/loginPage.dart';
import '../../../themeData.dart';
import '../../../utils/globalUtils.dart';
import '../../widgets/loginButton.dart';

class PreLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).canvasColor,
        pinned: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            color: MyTheme.of(context).iconsColor,
          ),
        ],
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 100),
                  child: Icon(
                    profile,
                    size: 100,
                    color: Colors.grey.shade300,
                  ),
                ),
                LoginButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () => print("Tapped"),
                      splashColor: Colors.grey.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "register".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
