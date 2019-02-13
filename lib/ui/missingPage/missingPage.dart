import 'package:flutter/material.dart';
import '../../utils/iconTypes.dart';
import '../singleChatPage/chat.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/tags.dart';
import 'package:flutter/cupertino.dart';
import '../../themeData.dart';
import '../../models/card.dart';
import '../widgets/imageCarousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MissingDetails extends StatefulWidget {
  final CardModel card;

  MissingDetails({@required this.card});

  @override
  _MissingDetailsState createState() => _MissingDetailsState(card);
}

class _MissingDetailsState extends State<MissingDetails> {
  CardModel card;

  _MissingDetailsState(this.card);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () => print("Share"),
                color: Theme.of(context).iconTheme.color,
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                color: Theme.of(context).iconTheme.color,
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                  color: Theme.of(context).iconTheme.color),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: card.id,
                  child: (card.images.isNotEmpty)
                      ? Container(
                        height: 300,
                        child: ImageCarousel(
                          viewport: .9,
                          images: card.images,
                        ),
                      )
                      : Container(
                    height: 200,
                    color: Colors.blueGrey[100],
                    child: Icon(
                      getTypeIcon(card.type),
                      color: Colors.blueGrey,
                      size: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("50"),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(Icons.remove_red_eye),
                          SizedBox(
                            width: 20,
                          ),
                          Hero(
                            tag: "icon${card.id}",
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: card.missing
                                      ? MyTheme.of(context).kPink
                                      : MyTheme.of(context).kGreen,
                                  shape: BoxShape.circle),
                              child: Icon(
                                  card.missing
                                      ? FontAwesomeIcons.search
                                      : FontAwesomeIcons.mapMarkedAlt,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Text(card.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        card.description,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            (card.missing) ? "Perdida en: " : "Encontrada en: ",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              card.location,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: List.generate(
                            card.tags.length,
                            (i) => Tag(
                                  tag: card.tags[i],
                                  context: context,
                                )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(50.0)),
                          onPressed: () => print("Share"),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Share",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/profile_pic.jpg"),
                            radius: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Raul M.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor:  MyTheme.of(context).kBackground,
      bottomNavigationBar: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
            gradient: LinearGradient(colors: [
              MyTheme.of(context).kPrimaryColor,
              MyTheme.of(context).kPrimaryColor,
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
