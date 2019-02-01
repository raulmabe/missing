import 'package:flutter/material.dart';
import './uploadPage_vm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../themeData.dart';
import 'package:vector_math/vector_math_64.dart' as v3;
import 'dart:math';
import '../animations/checkAnim.dart';

class EditCardDialog extends StatefulWidget {
  final TempCardModel card;
  final VoidCallback back;
  final ViewModel viewModel;

  EditCardDialog({this.card, this.back, this.viewModel});

  @override
  _EditCardDialogState createState() => _EditCardDialogState();
}

class _EditCardDialogState extends State<EditCardDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _opacityAnim;
  Animation<double> _scaleAnim;
  Animation<double> _shakeAnim;

  bool _posted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _opacityAnim = Tween<double>(begin: 0.0, end: .8).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
            0.0, 450 / _controller.duration.inMilliseconds.toDouble(),
            curve: Curves.fastOutSlowIn)));
    _scaleAnim = CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 450 / _controller.duration.inMilliseconds.toDouble(),
            curve: Curves.elasticInOut));
    _shakeAnim = CurvedAnimation(
        parent: _controller, curve: Interval(.25, 1, curve: Curves.linear));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();

    _posted = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(_opacityAnim.value),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Center(
          child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: (_posted) ? 3 : 1,
                    child: (_posted) ? AspectRatio(
                      aspectRatio: 1,
                      child: CheckAnimation(
                        onComplete: (){ widget.back();
                          Navigator.pop(context); 
                        },
                      ) ,
                    ):
                      Transform(
                        transform: Matrix4.translation(_getTranslation()),
                        child: Icon(
                          FontAwesomeIcons.exclamationTriangle,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                  ),
                  Expanded(
                    flex: (_posted) ? 2 : 1,
                    child: (_posted) ? Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                      "Posted!",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    ) : Column(
                      children: <Widget>[
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: InkWell(
                            onTap: () => widget.back(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: Text(
                                "Edit".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: MyTheme.of(context).kSecondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Material(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: InkWell(
                              onTap: _submit,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "GO ahead".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2.0),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              )

              /*Builder(
                builder: (context) {
                  if (_posted) return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CheckAnimation(
                        onComplete: (){ widget.back();
                          Navigator.pop(context); 
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Posted!",
                          style: TextStyle(
                            fontSize: 18
                          )
                        ),
                      )
                    ],
                  );
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translation(_getTranslation()),
                        child: Icon(
                          FontAwesomeIcons.exclamationTriangle,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: InkWell(
                          onTap: () => widget.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: Text(
                              "Edit".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: MyTheme.of(context).kSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Material(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: InkWell(
                            onTap: _submit,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              height: 20,
                              child: Text(
                                "GO ahead".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2.0),
                              ),
                            )),
                      ),
                    ],
                  );
                },
              )*/
              ),
        ),
      ),
    );
  }

  void _submit() {
    widget.viewModel.onAddCard(widget.card);
    setState(() {
      _posted = true;
    });
  }

  v3.Vector3 _getTranslation() {
    double progress = _shakeAnim.value;
    double offset = sin(progress * pi * 100);
    return v3.Vector3(offset, -offset, 0.0);
  }
}
