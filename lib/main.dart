import 'package:flutter/material.dart';
import './ui/homePage/homePage.dart';
import './themeData.dart';
import 'package:flutter/services.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './models/appState.dart';
import './redux/reducers.dart';
import 'package:redux_logging/redux_logging.dart';
import './redux/middleware.dart';
import './redux/actions.dart';
import 'package:built_collection/built_collection.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState((b) => b.cards = ListBuilder([])),
      middleware: [new LoggingMiddleware.printer(),appStateMiddleware
        ]
    );

    return StoreProvider<AppState>(
      store: store,
      child: MyTheme(child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'missing',
            debugShowCheckedModeBanner: false,
            color: Color(0xffff7675),
            theme: buildTheme(context, false),
            home: StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(GetCards()),
              builder: (context, store) => HomePage(),
            ),
          );
        },
      )),
    );
  }

  ThemeData buildTheme(context, bool darkTheme) {
    ThemeData baseTheme = (darkTheme)
        ? ThemeData(
            brightness: Brightness.dark,
            fontFamily: "Nunito",
          )
        : ThemeData(
            brightness: Brightness.light,
            fontFamily: "Nunito",
          );
    return baseTheme.copyWith(
        primaryColor: MyTheme.of(context).kPrimaryColor,
        primaryColorLight: MyTheme.of(context).kPrimaryLight,
        primaryColorDark: MyTheme.of(context).kPrimaryDark,
        splashColor: MyTheme.of(context).kPrimaryColor.withAlpha(150),
        canvasColor: Colors.white);
  }
}
