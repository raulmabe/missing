import 'package:flutter/material.dart';
import 'dart:math';

class MyTheme extends InheritedWidget {
  // My Colors
  final kPrimaryColor = const Color(0xff304048);
  final kPrimaryLight = const Color(0xffFF5858);
  final kPrimaryDark = const Color(0xFFCC6866);
  final kSecondaryColor = const Color(0xff72d0c3);
  final kSecondaryLight = Colors.redAccent[100];
  final kSecondaryDark = const Color(0xFF009faf);

  final iconsColor = Colors.grey.shade800;

  final kYellow = const Color(0xffffc700);
  final kGreen = const Color(0xff24f2ad);
  final kBlue = const Color(0xff2f9bff);
  final kPurple = const Color(0xff7218ff);
  final kPink = const Color(0xffff3896);

  final kBackground = Colors.white;

  final kChatsCards = const Color(0xFFFFFFFF);
  final kMyMessageColor = const Color(0xffff7675);
  final kNotMyMessageColor = ThemeData.light().cardColor;

  Color getRandomOfFive(Color exclusive){
    if(exclusive == null) exclusive = Colors.transparent;
    int x = Random().nextInt(5);
    switch(x){
      case 0:
      return exclusive == kYellow ? getRandomOfFive(exclusive) : kYellow;
      case 1:
      return exclusive == kGreen ? getRandomOfFive(exclusive) : kGreen;
      case 2:
      return exclusive == kBlue ? getRandomOfFive(exclusive) : kBlue;
      case 3:
      return exclusive == kPurple ? getRandomOfFive(exclusive) : kPurple;
      case 4:
      return exclusive == kPink ? getRandomOfFive(exclusive) : kPink;
    }

  }


  MyTheme({child}) : super(child: child);

  static MyTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyTheme);
  }

  @override
  bool updateShouldNotify(MyTheme old) {
    return false;
  }
}
