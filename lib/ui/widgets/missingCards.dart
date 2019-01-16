import 'package:flutter/material.dart';
import 'dart:math';

class MissingCard extends StatefulWidget {

  final String title, description;
  final List<String> tags;

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
    
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.white,
      child:Column(
        children: <Widget>[
          Container(
            height: (new Random().nextDouble() * 100) + 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/gato${new Random().nextInt(2)+1}.jpg"),
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}