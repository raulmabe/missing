import 'package:flutter/material.dart';

class UploadImageIcon extends StatelessWidget {
  final image;
  final Function(dynamic) removeImage;

  OverlayEntry _overlayEntry;

  UploadImageIcon({this.image, this.removeImage}) {
    _overlayEntry = OverlayEntry(builder: (context) {
      return ImagePreview(
        image: image,
        back: _overlayEntry.remove,
        remove: removeImage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          image: DecorationImage(image: FileImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(onTap: () {
          Overlay.of(context).insert(_overlayEntry);
        }),
      ),
    );
  }
}

class ImagePreview extends StatefulWidget {
  final image;
  final VoidCallback back;
  final Function(dynamic) remove;

  ImagePreview({this.image, this.back, this.remove});

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _opacityAnim;
  Animation<double> _scaleAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _opacityAnim = Tween<double>(begin: 0.0, end: .8).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _scaleAnim =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            widget.back();
          },
          child: Container(
            color: Colors.blueGrey.withOpacity(_opacityAnim.value),
          ),
        ),
        ScaleTransition(
          scale: _scaleAnim,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: FileImage(widget.image)),
                  )),
              Material(
                  color: Colors.transparent,
                  child: FloatingActionButton(
                    onPressed: () {
                      widget.back();
                      widget.remove(widget.image);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.delete),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
