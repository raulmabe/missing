import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:missing/models/card.dart';
import 'package:missing/themeData.dart';
import 'package:missing/ui/widgets/chips.dart';
import 'package:missing/ui/widgets/imageCarousel.dart';

class MissingCardExpanded extends StatelessWidget {
  final CardModel card;

  MissingCardExpanded({this.card});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          (card.images != null && card.images.isNotEmpty)
              ? Hero(
                  tag: card.id,
                  child: Container(
                    height: 300,
                    child: ImageCarousel(
                      images: card.images,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                                ? MyTheme.of(context).missingColor
                                : MyTheme.of(context).foundColor,
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
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
                  children: buildTags(context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () => print("Share"),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Share",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
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
                      backgroundImage: AssetImage("assets/profile_pic.jpg"),
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
          ),

          // Google maps, still on beta, doesnt work well
          /* Container(
              height: 200.0,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
        print(controller.cameraPosition);
                },
                options: GoogleMapOptions(
        cameraPosition: CameraPosition(
          target: LatLng(41.501194, 2.343651),
          zoom: 12.0
        ),
        zoomGesturesEnabled: false,
                ),
              ),
            ) */
        ],
      ),
    );
  }

  List<Widget> buildTags(context) {
    List<Widget> list = [];
    for (int i = 0; i < card.tags.length; ++i) {
      list.add(Tag(
        tag: card.tags[i],
        context: context,
      ));
    }
    return list;
  }
}