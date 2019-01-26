import 'package:flutter/material.dart';
import '../../../viewModels/cardViewModel.dart';
import './generalCard.dart';
import './infoCard.dart';
import '../../../types.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  CardViewModel card;

  GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    card = CardViewModel();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
    slivers: <Widget>[
      SliverAppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GeneralCard(
                  onBoolChanged: (missing) {
                    setState(() {
                      card.missing = missing;
                    });
                  },
                  onCategoryChanged: (i) {
                    setState(() {
                      card.type = AppType.values[i];
                    });
                  },
                  card: card,
                ),
                SizedBox(
                  height: 30.0,
                ),
                InfoCard(formKey: formKey, card: card,)
              ],
            )),
      ),
    ],
        ),
        backgroundColor: Colors.blueGrey[50],
        bottomNavigationBar: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: _submitUpload,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Submit".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0),
            ),
          ),
        ),
      ),
    ),
        ),
      );
  }

    void _submitUpload(){
      var form = formKey.currentState;

      if(form.validate()){
        form.save();
        print("Succed");
      }
    }
}
