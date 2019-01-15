import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topLeft,
          colors: [
            Theme.of(context).primaryColor,
            Colors.redAccent[100]
          ]
        )
      ),
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){print("Settings tapped");},
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Profile image
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0
                      )
                  ),
                  child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_pic.jpg"),
                  radius: 50.0,
                ),
                ),
                getTextColumn(
                  number: 0,
                  text: "Found"
                ),
                getTextColumn(
                  number: 2,
                  text: "Missings"
                ),
              ],
            ),
            getInfo(),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextColumn({@required int number, @required String text}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "$number",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.grey[50]
          )
          ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.grey[50]
          )
        )
      ],
    );
  }

  Widget getInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 40,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.mapMarkerAlt,
            size: 20.0,
            color: Colors.white,
            ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Premià de mar, Barcelona",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
              ),
              ),
          )
        ],
      ),
    );
  }
}

