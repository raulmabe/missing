import 'package:flutter/material.dart';
import '../../types.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './iconType.dart';

typedef int2void = Function(int);

class CustomRadio extends StatelessWidget {
  int2void onTap;
  final bool isSelected;
  final AppType type;
  final Color unselectedColor;
  final Color selectedColor;

  final double size;

  CustomRadio(
      {this.isSelected,
      this.size,
      this.type,
      this.onTap,
      this.unselectedColor,
      this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: isSelected ? selectedColor : unselectedColor, width: 3.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(type.index),
          splashColor: selectedColor.withOpacity(.5),
          child: IconType(
            type: type,
            color: isSelected ? Colors.white : unselectedColor,
            size: size / (80 / 40),
          ),
        ),
      ),
    );
  }
}
