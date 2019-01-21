import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './chat.dart';
import '../../types.dart';
import '../widgets/chips.dart';

class MissingDetails extends StatelessWidget {

  final int id;
  String title, description, location;
  final List<String> tags;
  AppType type;

  MissingDetails({@required this.id, @required this.title, @required this.description,@required this.location, @required this.type, this.tags});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: <Widget>[
          // Favourite missings
          /* IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){},
            color: Colors.white,
          ), */
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},
            color: Theme.of(context).primaryColor,
          )
        ],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Theme.of(context).primaryColor.withAlpha(70)
              )
            ),
            child: Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                  tag: id,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/gato1.jpg"),
                      )
                    ),
                  ),
                  ),
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
                            SizedBox(width: 5.0,),
                            Icon(Icons.remove_red_eye)
                          ],
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          )
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 18.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Perdida en: ",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Text(location,
                                style: TextStyle(
                                  fontSize: 16.0
                                ),
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: buildTags(context, tags),
                        ),
                        SizedBox(
                          height: 20.0,
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
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0
                              ),
                            ),
                          ],
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
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat("Alicia"),
                ),
              );
            },
            child: Container(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}