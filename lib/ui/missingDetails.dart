import 'package:flutter/material.dart';

class MissingDetails extends StatelessWidget {

  final int id;
  String title, description;

  MissingDetails({@required this.id, @required this.title, @required this.description}){
    title = "Sua perdida en Barcelona";
    description = "Sua perdida en Barcelona en la calle Aragon, a las 13:00, tiene chip, responde a su nombre es muy asustadiza etc etc etc etcjrnekfnerlkfnerfr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Missing",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w400
          )
          ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 1.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
              tag: id,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/perro1.jpg"),
                  )
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 50.0,
                  bottom: 30.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}