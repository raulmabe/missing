import 'package:flutter/material.dart';

class Tag extends Chip {

  Tag({String tag, BuildContext context, dynamic onDeleted}) : super(
    label: Text(tag, style: TextStyle(color: Colors.white)),
    onDeleted: onDeleted,
    backgroundColor: Theme.of(context).primaryColor.withAlpha(150),
    deleteIconColor: Colors.white
  );
}