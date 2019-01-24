import 'package:flutter/material.dart';
import './chat.dart';
import '../../domain/actions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../viewModels/cardViewModel.dart';
import '../widgets/missingCardExpanded.dart';
import 'package:flutter/cupertino.dart';

class MissingDetails extends StatelessWidget {
  final CardViewModel card;
  
  MissingDetails({@required this.card});

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
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorLight,
                  ]
                )
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
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
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.white),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MissingCardExpanded(card: card,),
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
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight
            ])),
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
