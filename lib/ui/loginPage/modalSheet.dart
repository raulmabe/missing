import '../animations/loadingAnimation.dart';
import './loginPage_vm.dart';
import '../animations/checkAnim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../homePage/homePage_vm.dart';
import '../mockPage/mockPage.dart';

class ModalBottomSheet extends StatefulWidget {
  final LoginViewModel viewModel;
  final TempLoginModel loginInfo;
  ModalBottomSheet({this.viewModel, this.loginInfo});

  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String error;
  bool success = false;

  @override
  void initState() {
    super.initState();
    widget.viewModel.onLogin(widget.loginInfo, (b, error) async {
      Future.delayed(Duration(seconds: 3)).then((b) {
        Navigator.pop(context);
        if (success)
          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePageBuilder()));
      });
      setState(() {
        this.error = error;
        success = b;
        widget.viewModel.isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onTap: () {},
        onVerticalDragStart: (_) {},
        onVerticalDragEnd: (_) {},
        onVerticalDragUpdate: (_) {},
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: widget.viewModel.isLoading
                  ? LoadingAnimation(
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    )
                  : Builder(
                      builder: (context) {
                        if (success)
                          return CheckAnimation(
                            size: 100,
                            onComplete: () {},
                          );
                        else
                          return Icon(
                            Icons.error_outline,
                            size: 100,
                            color: Colors.red[800],
                          );
                      },
                    ),
              ),
              Container(
                child: Builder(
                  builder: (context) {
                    if (widget.viewModel.isLoading) {
                      return Text(
                        "Loading",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[800],
                        ),
                      );
                    }
                    if (success) {
                      return Text(
                        "Success!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      );
                    } else
                      return Text(
                        error ?? "Something went wrong",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red[800],
                        ),
                      );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
