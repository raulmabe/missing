import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'dart:async';

class ImageBox extends StatefulWidget {
  final Asset image;
  final int id;

  ImageBox({this.id, this.image});
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
    widget.image.releaseThumb();
    super.dispose();
  }

  Future _loadImage() async {
    if (widget.image.thumbData == null) {
      await widget.image.requestThumbnail(80, 80, quality: 50);
    }
    return widget.image.thumbData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Icon(
                Icons.error_outline,
                color: Colors.grey,
                size: 40,
              ),
            );
          }
          return Hero(
            tag: widget.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.memory(
                widget.image.thumbData.buffer.asUint8List(),
                fit: BoxFit.cover,
                gaplessPlayback: true,
              ),
            ),
          );
        } else {
          return Container(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
