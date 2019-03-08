import 'package:flutter/material.dart';
import '../../themeData.dart';

class LoginButton extends StatelessWidget {
  final Function onPressed;

  const LoginButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "login",
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 10),
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: MyTheme.of(context).kPrimaryColor,
          child: InkWell(
            onTap: onPressed,
            splashColor: Colors.white.withOpacity(.3),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "login".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
