import 'package:flutter/material.dart';
import '../../types.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef int2void = Function(int);

class CustomRadio extends StatelessWidget{
  
  int2void onTap;
  final bool isSelected;
  final AppType type;
  final Color color;

  CustomRadio({this.isSelected, this.type, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border:
              Border.all(color: color, width: 3.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(onTap: () => onTap(type.index),
        splashColor: color.withAlpha(170),
         child: Builder(
          builder: (context) {
            switch (type) {
              case AppType.PEOPLE:
                return Icon(
                  Icons.face,
                  color: isSelected
                      ? Colors.white
                      : color,
                  size: 30.0,
                );
              case AppType.PETS:
                return Icon(
                  Icons.pets,
                  color: isSelected
                      ? Colors.white
                      : color,
                  size: 30.0,
                );
              case AppType.THINGS:
                return Icon(
                  FontAwesomeIcons.archive,
                  color: isSelected
                      ? Colors.white
                      : color,
                  size: 30.0,
                );
            }
          },
        )),
      ),
    );
  }
}