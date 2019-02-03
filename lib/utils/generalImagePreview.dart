import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class GeneralImagePreview extends StatefulWidget {
  final List<List<int>> images;
  final index;
final Function(int) onChangeImage;

  GeneralImagePreview({@required this.images, this.index, this.onChangeImage});

  @override
  GeneralImagePreviewState createState() {
    return new GeneralImagePreviewState();
  }
}

class GeneralImagePreviewState extends State<GeneralImagePreview> {

  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(initialPage: widget.index, viewportFraction: 1);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          itemCount: widget.images.length,
          controller: _controller,
          physics: AlwaysScrollableScrollPhysics(),
          onPageChanged: (page) => widget.onChangeImage(page) ,
          itemBuilder: (context, index) {
            return List.generate(widget.images.length, (i) {
              return Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                  ),
                  Hero(
                    tag: i,
                    child: Center(
                      child: Image.memory(
                        widget.images[i],
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ],
              );
            })[index];
          }),
    );
  }
}
