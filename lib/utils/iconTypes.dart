import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../models/appTypes.dart';

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

