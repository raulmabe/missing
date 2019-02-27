import 'package:flutter/material.dart';
import '../uploadPage/uploadPage.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/softTransition.dart';
import '../../utils/globalUtils.dart';

class UploadCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Theme.of(context).canvasColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            SoftTransition(
              widget: UploadPage(),
            ),
          );
        },
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.grey,
                  width: 1.0)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.grey,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
