import 'package:flutter/material.dart';
import '../pages/missingDetails.dart';
import '../widgets/customBorder.dart';
import '../../viewModels/cardViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../themeData.dart';
import './iconType.dart';

class MissingCard extends StatelessWidget {
  CardViewModel card;

  double borderRadius = 10.0;

  MissingCard({this.card});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        shadowColor: card.missing
            ? MyTheme.of(context).missingColor
            : MyTheme.of(context).foundColor,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      if (card.images == null || card.images.isEmpty) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(borderRadius),
                                topRight: Radius.circular(borderRadius),
                              ),color: Colors.blueGrey[100]),
                              child: IconType(
                                type: card.type,
                                color: Colors.blueGrey,
                                size: 50
                              ),
                        );
                      } else {
                        return Hero(
                          tag: card.id,
                          child: Container(
                            height: card.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(borderRadius),
                                  topRight: Radius.circular(borderRadius),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: card.images[0],
                                )),
                          ),
                        );
                      }
                    },
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
              ),
              Container(
                //     missing ? Colors.redAccent : MyTheme.of(context).foundColor
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
                          width: 4.0),
                      bottomRightCornerSide: BorderSide(
                          color: card.missing
                              ? MyTheme.of(context).missingColor
                              : MyTheme.of(context).foundColor,
                          width: 3.0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius),
                      ),
                    )),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "${card.title} nº${card.id}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
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
            ],
          ),
        ));
  }
}
