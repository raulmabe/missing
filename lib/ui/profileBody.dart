import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                size: 30,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Profile image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3.0
                    )
                ),
                child: ClipOval(
                  child: Image.asset("assets/profile_pic.jpg"),
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
          Divider(),
        ],
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
            fontSize: 25.0
          )
          ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
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
            ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Premià de mar, Barcelona",
              style: TextStyle(
                fontSize: 16.0
              ),
              ),
          )
        ],
      ),
    );
  }
}

