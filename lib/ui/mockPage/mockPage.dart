import 'package:flutter/material.dart';

class MockPage extends StatefulWidget {
  @override
  _MockPageState createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());

    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        autofocus: true,
      ),
    );
  }
}