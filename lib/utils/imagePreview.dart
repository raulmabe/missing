import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  final List<List<int>> images;
  final index;
  ImagePreview({@required this.images, this.index});

  @override
  ImagePreviewState createState() {
    return new ImagePreviewState();
  }
}

class ImagePreviewState extends State<ImagePreview>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> opacityAnim;
  Animation<Offset> translateAnim;

  PageController _controller;

  int imageToDelete;

  @override
  void initState() {
    super.initState();
    imageToDelete = widget.index;
    _controller =
        PageController(initialPage: widget.index, viewportFraction: 1);

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    opacityAnim = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    translateAnim = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -1000))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn));

    _animationController.addListener(_handleDeleteAnimation);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageView.builder(
              itemCount: widget.images.length,
              controller: _controller,
              physics: AlwaysScrollableScrollPhysics(),
              onPageChanged: (i) => imageToDelete = i,
              itemBuilder: (context, index) {
                return List.generate(widget.images.length, (i) {
                  return Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                      ),
                      Transform.translate(
                          offset: translateAnim.value,
                          child: Opacity(
                            opacity: opacityAnim.value,
                            child: Hero(
                              tag: i,
                              child: Center(
                                child: Image.memory(
                                  widget.images[i],
                                  fit: BoxFit.contain,
                                  gaplessPlayback: true,
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                })[index];
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: FloatingActionButton(
                onPressed: () => _animationController.forward(),
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

  void _handleDeleteAnimation() {
    setState(() {
      if (_animationController.isCompleted) {
        print('Deleting ${imageToDelete}');
        if (imageToDelete != null && widget.images.length >= imageToDelete)
          widget.images.removeAt(imageToDelete);
        if (widget.images.isEmpty) Navigator.pop(context);
        _animationController.reset();
      }
    });
  }
}
