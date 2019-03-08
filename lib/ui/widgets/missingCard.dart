import '../../utils/globalUtils.dart';
import 'package:flutter/material.dart';
import '../missingPage/missingPage.dart';
import '../widgets/customBorder.dart';
import '../../models/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../themeData.dart';
import 'dart:typed_data';

class MissingCard extends StatelessWidget {
  final CardModel card;

  final double borderRadius = 10.0;
  final double imageHeight;

  MissingCard({this.card}) : imageHeight = card.images.isEmpty ? 100 : 250;

  @override
  Widget build(BuildContext context) {
    Color borderColor = getColorByState(context, card.missing);

    return Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Theme.of(context).canvasColor,
        child: InkWell(
          splashColor: card.missing
              ? MyTheme.of(context).kPink.withAlpha(170)
              : MyTheme.of(context).kGreen.withAlpha(170),
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
                        leftSide: BorderSide(color: borderColor, width: 2.0),
                        bottomSide: BorderSide(color: borderColor, width: 2.0),
                        bottomLeftCornerSide:
                            BorderSide(color: borderColor, width: 2.0),
                        bottomRightCornerSide:
                            BorderSide(color: borderColor, width: 2.0),
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
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              card.location,
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              String time;
                              if (DateTime.now().difference(card.createdTime).inDays >
                                  0)
                                time = DateTime.now()
                                        .difference(card.createdTime)
                                        .inDays
                                        .toString() +
                                    "d";
                              else if (DateTime.now()
                                      .difference(card.createdTime)
                                      .inHours >
                                  0)
                                time = DateTime.now()
                                        .difference(card.createdTime)
                                        .inHours
                                        .toString() +
                                    "h";
                              else if (DateTime.now()
                                      .difference(card.createdTime)
                                      .inMinutes >
                                  0)
                                time = DateTime.now()
                                        .difference(card.createdTime)
                                        .inMinutes
                                        .toString() +
                                    "m";
                              else
                                time = DateTime.now()
                                        .difference(card.createdTime)
                                        .inSeconds
                                        .toString() +
                                    "s";
                              return Text(
                                time,
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.subtitle,
                              );
                            },
                          )
                        ],
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
              if (card.images.isEmpty) {
                return Container(
                  height: imageHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: Colors.blueGrey.shade50),
                  child: Icon(getIconByType(card.type, true),
                      color: Colors.blueGrey.shade100, size: 50),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Container(
                    height: imageHeight,
                    width: double.infinity,
                    child: Image.memory(
                      Uint8List.fromList(card.images[0].asList()),
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
            offset: Offset(0, 35 / 2),
            child: Hero(
              tag: "icon${card.id}",
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: getColorByState(context, card.missing),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                    card.missing
                        ? FontAwesomeIcons.search
                        : FontAwesomeIcons.mapMarkedAlt,
                    size: 20,
                    color:Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
