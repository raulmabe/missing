import 'package:flutter/material.dart';
import '../../themeData.dart';
import '../uploadPage/uploadPage.dart';
import 'package:flutter/cupertino.dart';

class UploadCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(10.0),
      color: MyTheme.of(context).kUploadCard,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => UploadPage(),
            ),
          );
        },
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Theme.of(context).primaryColor.withAlpha(100),
                  width: 3.0)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor.withAlpha(100),
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
