import 'package:flutter/material.dart';

class MyTheme extends InheritedWidget{

  // My Colors
  final kPrimaryColor = const Color(0xffff7675);
  final kPrimaryLight = const Color(0xffFF9898);  //const Color(0xFFffcdd2);
  final kPrimaryDark = const Color(0xFFCC6866);
  final kSecondaryColor = const Color(0xFFFFEBEE);
  final kSecondaryLight = const Color(0xFF88ffff);
  final kSecondaryDark = const Color(0xFF009faf);

  final kSplashColor = const Color(0xFFFFDDDC);

  final kChatsCards = const Color(0xFFDE9E9C);
  final kMyMessageColor = const Color(0xffD47E7D);
  final kNotMyMessageColor = ThemeData.light().cardColor;

  final kUploadCard = const Color(0xffDF6766);

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