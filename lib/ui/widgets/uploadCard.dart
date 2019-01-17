import 'package:flutter/material.dart';

class UploadCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.redAccent[100],
      child: InkWell(
        onTap: () => print("Add new missing"),
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.red[100],
              width: 3.0
            )
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.red[100],
              size: 50.0,
              ),
          ),
        ),
      ),
    );
  }
}