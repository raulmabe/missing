import 'package:flutter/material.dart';
import '../../types.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconType extends StatelessWidget {
  final Color color;
  final double size;
  final AppType type;
  final bool light;

  IconType(
      {this.color = Colors.black,
      this.size = 20.0,
      @required this.type,
      this.light = false});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (type) {
      case AppType.PEOPLE:
        icon =
            (light) ? FontAwesomeIcons.idBadge : FontAwesomeIcons.solidIdBadge;
        break;
      case AppType.PETS:
        icon = FontAwesomeIcons.paw;
        break;
      case AppType.THINGS:
        icon = FontAwesomeIcons.archive;
        break;
    }
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
