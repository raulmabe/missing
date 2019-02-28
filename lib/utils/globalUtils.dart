import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../models/appTypes.dart';
import '../themeData.dart';

IconData basketball = IconData(0xf3df,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData basketball_solid = IconData(0xf3e0,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData people = IconData(0xf47d,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData people_solid = IconData(0xf47e,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData pets = IconData(0xf479,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData pets_solid = IconData(0xf47a,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
    
IconData chats = IconData(0xf3fb,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData chats_solid = IconData(0xf3fc,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData profile = IconData(0xf419,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
IconData profile_solid = IconData(0xf41A,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);

IconData getIconByType(AppTypes type, bool solid) {
  switch (type) {
    case AppTypes.PEOPLE:
      return solid ? people_solid : people;
    case AppTypes.PETS:
      return solid ? pets_solid :pets;
    case AppTypes.ITEMS:
      return solid ? basketball_solid : basketball;
  }
}

Color getColorByState(BuildContext context, bool missing) {
  return (missing) ? MyTheme.of(context).kPurple : MyTheme.of(context).kGreen;
}

enum AppTabs { PEOPLE, PETS, ITEMS, CHATS, PROFILE }

IconData getIconFromTab(AppTabs tab, bool selected) {
  switch (tab) {
    case AppTabs.PEOPLE:
      return selected
          ? getIconByType(AppTypes.PEOPLE, true) : getIconByType(AppTypes.PEOPLE, false);
    case AppTabs.PETS:
      return selected ? 
      getIconByType(AppTypes.PETS, true) :
      getIconByType(AppTypes.PETS, false);
    case AppTabs.ITEMS:
      return selected
          ? getIconByType(AppTypes.ITEMS, true)
          : getIconByType(AppTypes.ITEMS, false);
    case AppTabs.CHATS:
      return selected ? chats_solid : chats;
    case AppTabs.PROFILE:
      return selected ? profile_solid :profile;
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
