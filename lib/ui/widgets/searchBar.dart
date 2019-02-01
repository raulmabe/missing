import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50.0),
      color: Colors.transparent,
      elevation: 12.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                  decoration: new InputDecoration.collapsed(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    )
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25.0,
              )
            ],
          ),
        ),
      )
    );
    /*
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Theme.of(context).primaryColor
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
            ),
            textAlign: TextAlign.center,
            decoration: new InputDecoration.collapsed(
              hintText: "Search your missing",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              )
            )
            ),
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,              
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ],
      ),
    );*/
  }
}