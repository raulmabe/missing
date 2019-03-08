import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../../themeData.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.grey.shade700;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Theme.of(context).brightness,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text("Register".toUpperCase(),
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
                GoogleRegisterButton(),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  child: Text(
                    "or register with your email",
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
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (str) => null,
                  autocorrect: false,
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
                Hero(
                  tag: "register",
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onTap: () => print("Tapped"),
                        splashColor: Colors.grey.shade200,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "register".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
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

  _submitRegister() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }
}

class GoogleRegisterButton extends StatelessWidget {
  const GoogleRegisterButton({
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
                  "Register with Google".toUpperCase(),
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
