import 'package:flutter/material.dart';
import '../../models/appTypes.dart';
import '../../utils/globalUtils.dart';

typedef int2void = Function(AppTypes);

class CustomRadio extends StatelessWidget {
  final int2void onTap;
  final bool isSelected;
  final AppTypes type;
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
              color: isSelected ? selectedColor : unselectedColor, width: 1.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(type),
          splashColor: selectedColor.withOpacity(.5),
          child: Icon(
            getTypeIcon(type),
            color: isSelected ? Colors.white : unselectedColor,
            size: size / (80 / 40),
          ),
        ),
      ),
    );
  }
}
