import 'package:flutter/material.dart';

class MyTheme extends InheritedWidget{

  // My Colors
  final kPrimaryColor = const Color(0xffff7675);
  final kPrimaryLight = Colors.red[100];  //const Color(0xFFffcdd2);
  final kPrimaryDark = const Color(0xFFCC6866);
  final kSecondaryColor = const Color(0xFFFFEBEE);
  final kSecondaryLight = Colors.redAccent[100];
  final kSecondaryDark = const Color(0xFF009faf);

  final kSplashColor = const Color(0xFFFFDDDC);

  final kChatsCards = const Color(0xFFFFFFFF);
  final kMyMessageColor = const Color(0xffff7675);
  final kNotMyMessageColor = ThemeData.light().cardColor;

  final kUploadCard = Colors.grey[50];//Colors.redAccent[100];

  final kIconsLight = Colors.white;
  final kIconsDark = const Color(0xff732A26);

  MyTheme({child}) : super(child: child);

  static MyTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyTheme);
  }

  @override
  bool updateShouldNotify(MyTheme old) {
    return false;
  }

}