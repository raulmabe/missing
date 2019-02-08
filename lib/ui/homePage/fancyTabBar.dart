import '../../models/appTypes.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;
import '../../utils/iconTypes.dart';

class FancyTabBar extends StatefulWidget {
  final Function(int) onTabTap;
  final int childs;
  FancyTabBar({this.onTabTap, this.childs = 4});

  @override
  _FancyTabBarState createState() => _FancyTabBarState();
}

class _FancyTabBarState extends State<FancyTabBar>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween<double> _positionTween;
  Animation<double> _positionAnimation;

  AnimationController _fadeOutController;
  Animation<double> _fadeFabOutAnimation;
  Animation<double> _fadeFabInAnimation;

  double fabIconAlpha = 1.0;
  IconData nextIcon = Icons.search;
  IconData activeIcon = Icons.search;

  int currentSelected = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: ANIM_DURATION));
    _fadeOutController = AnimationController(
        vsync: this, duration: Duration(milliseconds: ANIM_DURATION ~/ 5));

    _positionTween = Tween<double>(begin: 0.0, end: 0.0);
    _positionAnimation = _positionTween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeIcon = nextIcon;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.8, 1.0, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 65,
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -1.0),
                blurRadius: 8.0)
          ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TabItem(
                  selected: currentSelected == 0,
                  type: AppTypes.PEOPLE,
                  callbackFunction: () => onTabSelected(AppTypes.PEOPLE, 0)),
              TabItem(
                  selected: currentSelected == 1,
                  type: AppTypes.PETS,
                  callbackFunction: () => onTabSelected(AppTypes.PETS, 1)),
              TabItem(
                  selected: currentSelected == 2,
                  type: AppTypes.THINGS,
                  callbackFunction: () => onTabSelected(AppTypes.THINGS, 2)),
              TabItem(
                  selected: currentSelected == 3,
                  callbackFunction: () => onTabSelected(null, 3)),
            ],
          ),
        ),
        IgnorePointer(
          child: Container(
            color: Colors.transparent,
            child: Align(
              heightFactor: 1.0,
              alignment: Alignment(_positionAnimation.value, 0.0),
              child: FractionallySizedBox(
                widthFactor: 1 / widget.childs,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: ClipRect(
                        clipper: HalfClipper(),
                        child: Container(
                          child: Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 8.0)
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 90,
                      child: CustomPaint(
                        painter: HalfPainter(),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                                color: Colors.white,
                                width: 5.0,
                                style: BorderStyle.none)),
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Opacity(
                            opacity: fabIconAlpha,
                            child: Icon(
                              activeIcon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void onTabSelected(AppTypes type, int index) {
    widget.onTabTap(index);

    setState(() {
      nextIcon = getTypeIcon(type);
      currentSelected = index;
    });
    _initAnimationAndStart(_positionAnimation.value, ((2*index)/(widget.childs-1))-1);
  }

  void _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();

    _animationController.forward();
    _fadeOutController.forward();
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height / 2);

    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class HalfPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0.0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10.0, 0, size.width - 20, 70);
    final Rect afterRect =
        Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0.0), vector.radians(90.0), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, vector.radians(0.0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180.0), vector.radians(-90.0), false);
    path.close();

    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class TabItem extends StatefulWidget {
  final AppTypes type;
  final bool selected;
  final Function callbackFunction;

  TabItem(
      {@required this.type,
      @required this.selected,
      @required this.callbackFunction});

  @override
  _TabItemState createState() => _TabItemState();
}

const double ICON_OFF = -3.0;
const double ICON_ON = 0.0;
const double TEXT_OFF = 3.0;
const double TEXT_ON = 1.0;
const double ALPHA_OFF = 0.0;
const double ALPHA_ON = 1.0;
const int ANIM_DURATION = 300;

class _TabItemState extends State<TabItem> {
  double iconYAlign = ICON_ON;
  double textYAlign = TEXT_OFF;
  double iconAlpha = ALPHA_ON;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setIconTextAlpha();
  }

  void _setIconTextAlpha() {
    setState(() {
      iconYAlign = widget.selected ? ICON_OFF : ICON_ON;
      textYAlign = widget.selected ? TEXT_ON : TEXT_OFF;
      iconAlpha = widget.selected ? ALPHA_OFF : ALPHA_ON;
    });
  }

  @override
  void didUpdateWidget(TabItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _setIconTextAlpha();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: ANIM_DURATION),
              alignment: Alignment(0.0, textYAlign),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  getTypeText(widget.type),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeIn,
              alignment: Alignment(0.0, iconYAlign),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: ANIM_DURATION),
                opacity: iconAlpha,
                child: IconButton(
                  onPressed: widget.callbackFunction,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0.0),
                  alignment: Alignment(0.0, 0.0),
                  icon: Icon(
                    getTypeIcon(widget.type),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
