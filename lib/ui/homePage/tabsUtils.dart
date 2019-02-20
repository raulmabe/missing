import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/appTypes.dart';
import 'package:flutter/material.dart';
import '../../themeData.dart';
import '../../utils/iconTypes.dart';

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
  return MyTheme.of(context).kPrimaryColor;

  switch (tab) {
    case AppTabs.PEOPLE:
      return MyTheme.of(context).kYellow;
    case AppTabs.PETS:
      return MyTheme.of(context).kGreen;
    case AppTabs.ITEMS:
      return MyTheme.of(context).kPink;
    case AppTabs.CHATS:
      return MyTheme.of(context).kBlue;
    case AppTabs.PROFILE:
      return MyTheme.of(context).kPurple;
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
