import 'package:flutter/material.dart';
import '../widgets/missingCards.dart';

class AnimalBody extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return _AnimalBodyState();
    }
}

class _AnimalBodyState extends State<AnimalBody>{
        
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
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