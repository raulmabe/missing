import 'package:flutter/material.dart';
import 'dart:math';
import '../pages/missingDetails.dart';
import '../../types.dart';
import '../widgets/customBorder.dart';

class MissingCard extends StatefulWidget {
  final int id;
  final String title, description, location;
  final List<String> tags;
  final AppType type;
  final bool missing;

  MissingCard(
      {@required this.id,
      @required this.title,
      @required this.description,
      this.location,
      this.tags,
      this.missing,
      this.type});

  @override
  _MissingCardState createState() =>
      _MissingCardState(id, title, description, location, tags, missing, type);
}

class _MissingCardState extends State<MissingCard> {
  int id;

  String title, description, location;
  List<String> tags;
  AppType type;
  bool missing;

  double height = (new Random().nextDouble() * 100) + 100;

  _MissingCardState(this.id, this.title, this.description, this.location,
      this.tags, this.missing, this.type) {
    assert(id != null);
    assert(type != null);
    if (missing == null) missing = new Random().nextBool();
    if (title == null) title = "Item";
    if (description == null)
      description =
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    if (location == null) location = "Malgrat de Mar, Barcelona";
    if (tags == null) {
      tags = [];
      tags.addAll(["gato", "claro", "sua", "pequeña"]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MissingDetails(
                      id: id,
                      title: title,
                      description: description,
                      location: location,
                      type: this.type,
                      missing: missing,
                      tags: tags,
                    ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: id,
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/gato1.jpg"),
                      )),
                ),
              ),
              Container(
                //     missing ? Colors.redAccent : Colors.greenAccent
                decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: CustomRoundedRectangleBorder(
                      leftSide: BorderSide(
                          color:
                              missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 3.0),
                      bottomSide: BorderSide(
                          color:
                              missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 3.0),
                      bottomLeftCornerSide: BorderSide(
                          color:
                              missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 6.0),
                      bottomRightCornerSide: BorderSide(
                          color:
                              missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 3.0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                         ),
                    )),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 18.0,
                        ),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
