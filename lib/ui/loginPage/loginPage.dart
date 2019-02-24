import './modalSheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import './loginPage_vm.dart';
import '../../themeData.dart';

class LoginPage extends StatefulWidget {
  LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TempLoginModel loginInfo;

  @override
  void initState() {
    super.initState();
    loginInfo = TempLoginModel();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.grey.shade700;
    
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
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
                              style: TextStyle(color: textColor),
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
                                          BorderSide(color: textColor)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textColor.withOpacity(.8))),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: textColor.withOpacity(.8))),
                            ),
                            TextFormField(
                              validator: (str) {
                                if (str.isEmpty) return "Enter password please";
                              },
                              onSaved: (str) => loginInfo.password = str,
                              autocorrect: false,
                              obscureText: false,
                              style: TextStyle(color: textColor),
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
                                          BorderSide(color: textColor)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: textColor.withOpacity(.8))),
                                  suffixText: "Forgot your password?",
                                  suffixStyle: TextStyle(
                                      color: textColor.withOpacity(.8)),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: textColor.withOpacity(.8))),
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
            return ModalSheetBuilder(
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
          color: MyTheme.of(context).kPrimaryColor, borderRadius: BorderRadius.circular(100)),
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
                    color: Theme.of(context).canvasColor),
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
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 50,
        child: FlutterLogo(
          colors: Colors.pink,
          size: 60,
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
