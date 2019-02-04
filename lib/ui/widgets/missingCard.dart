import 'package:flutter/material.dart';
import '../missingPage/missingPage.dart';
import '../widgets/customBorder.dart';
import '../../models/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../themeData.dart';
import './iconType.dart';

class MissingCard extends StatelessWidget {
  final CardModel card;

  final double borderRadius = 10.0;
  double imageHeight = 250.0;

  MissingCard({this.card}) {
    if (card.images.isEmpty) imageHeight = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        child: InkWell(
          splashColor: card.missing
              ? MyTheme.of(context).missingColor.withAlpha(170)
              : MyTheme.of(context).foundColor.withAlpha(170),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => MissingDetails(
                      card: card,
                    ),
              ),
            );
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(borderRadius)),
                child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: CustomRoundedRectangleBorder(
                        leftSide: BorderSide(
                            color: card.missing
                                ? MyTheme.of(context).missingColor
                                : MyTheme.of(context).foundColor,
                            width: 3.0),
                        bottomSide: BorderSide(
                            color: card.missing
                                ? MyTheme.of(context).missingColor
                                : MyTheme.of(context).foundColor,
                            width: 3.0),
                        bottomLeftCornerSide: BorderSide(
                            color: card.missing
                                ? MyTheme.of(context).missingColor
                                : MyTheme.of(context).foundColor,
                            width: 3.0),
                        bottomRightCornerSide: BorderSide(
                            color: card.missing
                                ? MyTheme.of(context).missingColor
                                : MyTheme.of(context).foundColor,
                            width: 3.0),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            topLeft: Radius.circular(borderRadius)),
                      )),
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: imageHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          card.title,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        card.location,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildImage(context),
            ],
          ),
        ));
  }

  Widget _buildImage(context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: card.id,
          child: Builder(
            builder: (context) {
              if (card.images == null || card.images.isEmpty) {
                return Container(
                  height: imageHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: Colors.blueGrey[100]),
                  child:
                      IconType(type: card.type, color: Colors.blueGrey, size: 50),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Container(
                    height: imageHeight,
                    child: Image.memory(
                      card.images[0],
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Transform.translate(
            offset: Offset(0, 20),
            child: Hero(
              tag: "icon${card.id}",
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: card.missing
                      ? MyTheme.of(context).missingColor
                      : MyTheme.of(context).foundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                    card.missing
                        ? FontAwesomeIcons.search
                        : FontAwesomeIcons.mapMarkedAlt,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
