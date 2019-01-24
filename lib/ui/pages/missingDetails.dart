import 'package:flutter/material.dart';
import './chat.dart';
import '../../domain/actions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../viewModels/cardViewModel.dart';
import '../widgets/missingCardExpanded.dart';
import 'package:flutter/cupertino.dart';
import '../../themeData.dart';
import '../../domain/actions.dart';

class MissingDetails extends StatefulWidget {
  final CardViewModel card;

  MissingDetails({@required this.card});

  @override
  _MissingDetailsState createState() => _MissingDetailsState(card);
}

class _MissingDetailsState extends State<MissingDetails> {
  CardViewModel card;

  _MissingDetailsState(this.card);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              height: 200.0,
              decoration: ShapeDecoration(
                  shape: BeveledRectangleBorder(),
                  gradient: LinearGradient(
                      colors: card.missing
                          ? [
                              MyTheme.of(context).missingColor,
                              Theme.of(context).primaryColorLight,
                            ]
                          : [
                              MyTheme.of(context).foundColor,
                              Colors.teal[200]
                            ])),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: sharePost,
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                    color: Colors.white,
                  )
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MissingCardExpanded(
                    card: card,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
            gradient: LinearGradient(
                colors: card.missing
                    ? [
                        MyTheme.of(context).missingColor,
                        Theme.of(context).primaryColorLight,
                      ]
                    : [MyTheme.of(context).foundColor, Colors.teal[200]])),
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: _launchURL,
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white.withAlpha(80)))),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Chat("Alicia"),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.white.withAlpha(80)))),
                      child: Icon(
                        Icons.chat,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = 'tel:+34 691014930';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
