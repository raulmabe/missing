import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../models/appTypes.dart';
import '../themeData.dart';

IconData getTypeIcon(AppTypes type) {
  switch (type) {
    case AppTypes.PEOPLE:
      return Icons.face;
    case AppTypes.PETS:
      return FontAwesomeIcons.paw;
    case AppTypes.ITEMS:
      return FontAwesomeIcons.basketballBall;
  }
}

Color getColorByState(BuildContext context, bool missing){
  return (missing) ? MyTheme.of(context).kPurple :MyTheme.of(context).kGreen;
}

enum AppTabs { PEOPLE, PETS, ITEMS, CHATS, PROFILE }

IconData getIconFromTab(AppTabs tab) {
  switch (tab) {
    case AppTabs.PEOPLE:
      return getTypeIcon(AppTypes.PEOPLE);
    case AppTabs.PETS:
      return getTypeIcon(AppTypes.PETS);
    case AppTabs.ITEMS:
      return getTypeIcon(AppTypes.ITEMS);
    case AppTabs.CHATS:
      return Icons.send;
    case AppTabs.PROFILE:
      return FontAwesomeIcons.user;
  }
  return null;
}

Color getColorFromTab(context, AppTabs tab) {
  return MyTheme.of(context).kBlue;

  switch (tab) {
    case AppTabs.PEOPLE:
    case AppTabs.PETS:
    case AppTabs.ITEMS:
      return MyTheme.of(context).kPurple;
    case AppTabs.CHATS:
      return MyTheme.of(context).kYellow;
    case AppTabs.PROFILE:
      return MyTheme.of(context).kBlue;
  }
  return null;
}

String getTitleFromTab(AppTabs tab) {
  switch (tab) {
    case AppTabs.PEOPLE:
      return "People";
    case AppTabs.PETS:
      return "Pets";
    case AppTabs.ITEMS:
      return "Items";
    case AppTabs.CHATS:
      return "Chats";
    case AppTabs.PROFILE:
      return "Profile";
  }
  return null;
}

AppTabs getTabFromType(AppTypes type) {
  switch (type) {
    case AppTypes.PEOPLE:
      return AppTabs.PEOPLE;
    case AppTypes.PETS:
      return AppTabs.PETS;
    case AppTypes.ITEMS:
      return AppTabs.ITEMS;
  }
  return null;
}
