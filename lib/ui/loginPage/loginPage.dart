import './modalSheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import './loginPage_vm.dart';
import '../../themeData.dart';
import '../widgets/loginButton.dart';

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
      appBar: AppBar(
        elevation: 0.0,
        brightness: Theme.of(context).brightness,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text("login".toUpperCase(),
            style: Theme.of(context).textTheme.headline),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: MyTheme.of(context).iconsColor),
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 2,
                ),
                GoogleLoginButton(),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  child: Text(
                    "or log in with your email",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body1.copyWith(
                        color: Colors.grey.shade500,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                TextFormField(
                  validator: (str) {
                    if (str.isEmpty) return "Enter password please";
                  },
                  onSaved: (str) => loginInfo.email = str,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[100])),
                      errorStyle: TextStyle(color: Colors.red[100]),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[100])),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: textColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: textColor.withOpacity(.8))),
                      labelText: "Email",
                      labelStyle: TextStyle(color: textColor.withOpacity(.8))),
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
                          borderSide: BorderSide(color: Colors.red[100])),
                      errorStyle: TextStyle(color: Colors.red[100]),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[100])),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: textColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: textColor.withOpacity(.8))),
                      suffixText: "Forgot your password?",
                      suffixStyle: TextStyle(color: textColor.withOpacity(.8)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: textColor.withOpacity(.8))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10
                  ),
                  child: LoginButton(onPressed: _submitLogIn),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
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

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff4285F4), borderRadius: BorderRadius.circular(5)),
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
