import '../animations/loadingAnimation.dart';
import './loginPage_vm.dart';
import '../animations/checkAnim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../homePage/homePage_vm.dart';

class ModalBottomSheet extends StatefulWidget {
  final LoginViewModel viewModel;
  final TempLoginModel loginInfo;
  ModalBottomSheet({this.viewModel, this.loginInfo});

  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String error;
  bool success;

  @override
  void initState() {
    super.initState();
    success = false;
    error = "";
    widget.viewModel.onLogin(widget.loginInfo, (hasSucceded, error) async {
      setState(() {
        this.error = error;
        success = hasSucceded;
      });
      Future.delayed(Duration(seconds: 3)).then((b) {
        Navigator.pop(context);
        Navigator.pop(context);
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
          child: SafeArea(
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
                  child: Text(widget.viewModel.status ?? "None"),
                ),
                Container(
                  child: Text(widget.viewModel.isLoading ? "Loading" : "Ya no"),
                ),
                Container(
                  child: Builder(
                    builder: (context) {
                      if (widget.viewModel.isLoading) {
                        return Text(
                          "Waiting",
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        );
                      }
                      if (success) {
                        return Text(
                          "Success!",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        );
                      } else
                        return Text(
                          error ?? "Something went wrong",
                          style: TextStyle(
                            color: Colors.red[800],
                          ),
                        );
                    },
                  ),
                ),
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
