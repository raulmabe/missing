import 'package:flutter/material.dart';
import './widgets/missingCards.dart';

class Body extends StatefulWidget{

  Type type;

  Body({@required this.type});

  @override
    State<StatefulWidget> createState() {
      return _BodyState();
    }
}

class _BodyState extends State<Body>{
        
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: EdgeInsets.only(top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 10.0,
      children: <Widget>[
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
        MissingCard(
          title: null,
          description: null,
        ),
      ],
    );
  }
}

enum Type{
  PETS,PEOPLE,THINGS
}