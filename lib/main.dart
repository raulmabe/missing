import 'package:flutter/material.dart';
import './ui/homePage.dart';
import './ui/missingDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
/* 
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => HomePage(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/missingDetails': (context) => MissingDetails(),
      }, */
      title: 'missing',
      debugShowCheckedModeBanner: false,
      color: Color(0xffff7675),
      theme: ThemeData(
        primaryColor: Color(0xffff7675),
        splashColor: Colors.red[50],
        fontFamily: "Montserrat",
        primarySwatch: const MaterialColor(0xffff7675,
        const {
          50 : const Color(0xffff7675),
          100 : const Color(0xffff7675),
          200 : const Color(0xffff7675),
          300 : const Color(0xffff7675),
          400 : const Color(0xffff7675),
          500 : const Color(0xffff7675),
          600 : const Color(0xffff7675),
          700 : const Color(0xffff7675),
          800 : const Color(0xffff7675),
          900 : const Color(0xffff7675)}),
      ),
      home: HomePage(),
    );
  }
}
