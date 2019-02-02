import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePreview extends StatefulWidget {
  final images;
  final index;
  final Function(int) remove;

  ImagePreview({this.remove,@required this.images, this.index});

  @override
  ImagePreviewState createState() {
    return new ImagePreviewState();
  }
}

class ImagePreviewState extends State<ImagePreview> {
  PageController _controller;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.index);
    currentIndex = widget.index;

    _controller.addListener(() {
      setState(() {
        currentIndex = (_controller.page.toInt());
      });
    });
  }

  @override
  void dispose() {
    for (var bytes in widget.images) {
      bytes = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: AspectRatio(
              aspectRatio: 1,
                      child: PageView(
                        controller: _controller,
                children: List.generate(widget.images.length, (i) {
                  return Hero(
                    tag: currentIndex,
                    child: Image.memory(
                      widget.images[i].buffer.asUint8List(),
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  );
                }),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: FloatingActionButton(
                onPressed: () {
                  
                  widget.remove(currentIndex);

                },
                child: Icon(
                  Icons.delete,
                  size: 30,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
