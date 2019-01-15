import 'package:flutter/material.dart';

class MissingCard extends StatefulWidget {

  String title, description;
  List<String> tags;

  MissingCard({@required this.title, @required this.description, this.tags});

  @override
  _MissingCardState createState() => _MissingCardState(title, description, tags);
}

class _MissingCardState extends State<MissingCard> {

  String title, description;
  List<String> tags;

  _MissingCardState(this.title, this.description, this.tags){
    if(title == null) title = "Item";
    if(description == null) description = "My dog named Woof has been lost for 5 days in machasustets jfnrenfjee jrenfjnerjfnr jwen fjinwejkadwmsq djqwnsmwqpd";
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.grey[350],
        child:Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                color: Theme.of(context).primaryColor
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Theme.of(context).primaryColor
              ),
            ),
          ],
        )
      ),
    );
  }
}