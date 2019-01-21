import 'package:flutter/material.dart';

List<Widget> buildTags(BuildContext context, List<String> tags) {
    List<Widget> chips = [];
    for (int i = 0; i < tags.length; ++i) {
      chips.add(Chip(
        label: Text(tags[i]),
        labelStyle: TextStyle(
          color: Colors.white
        ),
        backgroundColor: Theme.of(context).primaryColor.withAlpha(150),
      ));
    }
    return chips;
}