import 'package:flutter/material.dart';
import 'package:angles/angles.dart';
import 'dart:math';
import 'dart:core';

class LoadingAnimation extends StatefulWidget {
  final double size;
  final Color color;
  LoadingAnimation({this.size, this.color});

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> curve;

  @override
  void initState() {
    super.initState();
    Color color = widget.color?? Colors.blueAccent;

    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
         _controller.reverse();
      } else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size ?? 100,
      width: widget.size ?? 100,
      child: CustomPaint(
        painter: CheckPainter(value: curve.value, color: Theme.of(context).primaryColor),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

class CheckPainter extends CustomPainter {
  Paint _paint;
  double value;
  Color color;

  CheckPainter({this.value, this.color}) {
    _paint = Paint()
      ..color = color ?? Colors.blueAccent
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    assert(value != null);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Background canvas
    var rect = Offset(0, 0) & size;

    _paint.color = color;

    double firstAngle = (360 * value);
    canvas.drawArc(rect, Angle.fromDegrees(firstAngle).radians,
        Angle.fromDegrees(firstAngle).radians, false, _paint);
  }

  @override
  bool shouldRepaint(CheckPainter old) {
    return old.value != value || old.color != color;
  }
}
