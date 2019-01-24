import 'package:flutter/material.dart';
import '../pages/missingDetails.dart';
import '../widgets/customBorder.dart';
import '../../viewModels/cardViewModel.dart';
import 'package:flutter/cupertino.dart';

class MissingCard extends StatelessWidget {
  CardViewModel card;

  double borderRadius = 10.0;

  MissingCard({this.card});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => MissingDetails(card: card,
                    ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
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
              ),
              Container(
                //     missing ? Colors.redAccent : Colors.greenAccent
                decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: CustomRoundedRectangleBorder(
                      leftSide: BorderSide(
                          color:
                              card.missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 3.0),
                      bottomSide: BorderSide(
                          color:
                              card.missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 3.0),
                      bottomLeftCornerSide: BorderSide(
                          color:
                              card.missing ? Colors.pinkAccent : Colors.greenAccent,
                          width: 4.0), 
                      bottomRightCornerSide: BorderSide(
                          color:
                              card.missing ? Colors.pinkAccent : Colors.greenAccent,
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
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 18.0,
                        ),
                        Expanded(
                          child: Text(
                            card.location,
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
