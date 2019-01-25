import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<AssetImage> images;
  ImageCarousel({@required this.images});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  PageController _controller;

  int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    _controller = PageController(
      viewportFraction: 1.0,
    );
    _controller.addListener(() {
      setState(() {index = _controller.page.toInt();});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        PageView(
            controller: _controller,
            children: List.generate(
                widget.images.length, (index) => _buildImage(index))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: new PhotoIndicator(
                widget.images.length, index))
      ],
    );
  }

  Widget _buildImage(int index) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: widget.images[index],
              )),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            colors: [Colors.black38, Colors.transparent],
          )),
        ),
      ],
    );
  }
}

class PhotoIndicator extends StatelessWidget {
  final int length;

  final int activeIndex;

  PhotoIndicator(this.length, this.activeIndex);

  Widget _buildIndicator(bool selected) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
        child: Container(
          height: 3.0,
          color: (selected) ? Colors.white : Colors.black.withOpacity(0.3)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (index) => _buildIndicator(activeIndex == index)),
    );
  }
}
