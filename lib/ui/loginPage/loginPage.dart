import './modalSheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import './loginPage_vm.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  final viewModel;
  LoginPage({this.viewModel});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey;

  TempLoginModel loginInfo;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();

    loginInfo = TempLoginModel();
  }

  @override
  Widget build(BuildContext context) {
    final page = ModalRoute.of(context);
  page.didPush().then((x) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light
      )
    );
  });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Logo(),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              validator: (str) {
                                if (str.isEmpty) return "Enter password please";
                              },
                              onSaved: (str) => loginInfo.email = str,
                              autocorrect: false,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red[100])),
                                  errorStyle: TextStyle(color: Colors.red[100]),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red[100])),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.8))),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: Colors.white.withOpacity(.8))),
                            ),
                            TextFormField(
                              validator: (str) {
                                if (str.isEmpty) return "Enter password please";
                              },
                              onSaved: (str) => loginInfo.password = str,
                              autocorrect: false,
                              cursorColor: Colors.white,
                              obscureText: false,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red[100])),
                                  errorStyle: TextStyle(color: Colors.red[100]),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red[100])),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(.8))),
                                  suffixText: "Forgot your password?",
                                  suffixStyle: TextStyle(
                                      color: Colors.white.withOpacity(.8)),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: Colors.white.withOpacity(.8))),
                            ),
                            LoginButton(onPressed: _submitLogIn),
                            GoogleLoginButton(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _submitLogIn() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return ModalBottomSheet(
              viewModel: widget.viewModel,
              loginInfo: loginInfo,
            );
          });
    }
  }
}

class LoginButton extends StatelessWidget {
  final Function onPressed;

  const LoginButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "login".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              )),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(.3),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: FlutterLogo(
            colors: Colors.pink,
            size: 60,
          ),
        ),
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff4285F4), borderRadius: BorderRadius.circular(100)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    )),
                Text(
                  "login with Google".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
