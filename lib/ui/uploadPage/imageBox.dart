import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'dart:async';

class ImageBox extends StatefulWidget {
  final List<int> imageBytes;
  final int id;

  ImageBox({this.id, this.imageBytes});
  @override
  _ImageBoxState createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:  widget.id,
      child: Container(
        width: 80,
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.memory(
            widget.imageBytes,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
