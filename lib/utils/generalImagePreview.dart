import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class GeneralImagePreview extends StatefulWidget {
  final List<List<int>> images;
  final index;
  final List<Widget> tags;
  GeneralImagePreview({@required this.images, this.index, this.tags});

  @override
  GeneralImagePreviewState createState() {
    return new GeneralImagePreviewState();
  }
}

class GeneralImagePreviewState extends State<GeneralImagePreview> {
  double _zoom;
  double _previousZoom;

  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(initialPage: widget.index, viewportFraction: 1);

    _zoom = 1.0;
    _previousZoom = null;
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
          itemBuilder: (context, index) {
            return List.generate(widget.images.length, (i) {
              return Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                  ),
                  Hero(
                    tag: i,
                    child: GestureDetector(
                      onScaleStart: _handleScaleStart,
                      onScaleUpdate: _handleScaleUpdate,
                      onDoubleTap: _handleScaleReset,
                      child: Transform(
                        transform: Matrix4.diagonal3(
                            new vector.Vector3(_zoom, _zoom, _zoom)),
                        child: Center(
                          child: Image.memory(
                            widget.images[i],
                            fit: BoxFit.contain,
                            gaplessPlayback: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            })[index];
          }),
    );
  }

  void _handleScaleStart(ScaleStartDetails start) {
    setState(() {
      _previousZoom = _zoom;
    });
  }

  void _handleScaleUpdate(ScaleUpdateDetails update) {
    setState(() {
      _zoom = _previousZoom * update.scale;
    });
  }

  void _handleScaleReset() {
    setState(() {
      _zoom = 1.0;
    });
  }
}
