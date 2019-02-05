import '../../utils/softTransition.dart';
import '../../utils/generalImagePreview.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ImageCarousel extends StatefulWidget {
  final List images;
  final double viewport;
  final double borderRadius;
  ImageCarousel({@required this.images, this.borderRadius, this.viewport = 1});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewport,
    );
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
            child: Padding(
              padding: EdgeInsets.all(20),
              child: DotsIndicator(
                controller: _controller,
                itemCount: widget.images.length,
                onPageSelected: (i) {
                  _controller.animateToPage(i,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
              ),
            ))
      ],
    );
  }

  Widget _buildImage(int index) {
    return Transform.scale(
      scale: 1, //(index.toDouble() ==_controller.page) ? 1 : .8,
          child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                tag: index,
                child: Image.memory(
                  widget.images[index],
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.center,
                  colors: [Colors.black, Colors.transparent],
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      SoftTransition(
                          widget: GeneralImagePreview(
                        images: widget.images,
                        index: index,
                        onChangeImage: (int page) {
                          _controller.animateToPage(page,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                      )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.5;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
