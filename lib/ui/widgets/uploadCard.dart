import 'package:flutter/material.dart';
import '../../themeData.dart';

class UploadCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(5.0),
      color: MyTheme.of(context).kUploadCard,
      child: InkWell(
        onTap: () => print("Add new missing"),
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
              width: 3.0
            )
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColorLight,
              size: 50.0,
              ),
          ),
        ),
      ),
    );
  }
}