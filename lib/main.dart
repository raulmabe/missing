import 'package:flutter/material.dart';
import './ui/pages/homePage.dart';
import './themeData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MyTheme(
          child: Builder(
            builder: (context){
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
                theme: buildTheme(context, false),
                home: HomePage(),
            );
            },
          )
    );
  }

  ThemeData buildTheme(context, bool darkTheme){
    ThemeData baseTheme = (darkTheme) ? 
      ThemeData(brightness: Brightness.dark, fontFamily: "Montserrat")
      : ThemeData(brightness: Brightness.light, fontFamily: "Montserrat");
    return baseTheme.copyWith(
      primaryColor: MyTheme.of(context).kPrimaryColor,
      primaryColorLight: MyTheme.of(context).kPrimaryLight,
      primaryColorDark: MyTheme.of(context).kPrimaryDark,
      splashColor: MyTheme.of(context).kPrimaryColor.withAlpha(150)
    );
  }
}



