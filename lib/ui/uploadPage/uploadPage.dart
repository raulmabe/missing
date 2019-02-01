import 'package:flutter/material.dart';
import './generalCard.dart';
import './infoCard.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/model.dart';
import './uploadPage_vm.dart';
import './customAlert.dart';
import 'dart:math';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TempCardModel card;

  ScrollController _controller;

  GlobalKey<FormState> formKey;

  bool categoryError;
  bool statusError;

  OverlayEntry _alertOverlay;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    formKey = GlobalKey<FormState>();

    categoryError = false;
    statusError = false;

    card = TempCardModel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CustomScrollView(
              controller: _controller,
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        GeneralCard(
                          key: UniqueKey(),
                          categoryError: categoryError,
                          statusError: statusError,
                          card: card,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InfoCard(
                          formKey: formKey,
                          card: card,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /*
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: StoreConnector<AppState, ViewModel>(
                    converter: (store) => ViewModel.create(store),
                    builder: (context, viewModel) => Material(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: InkWell(
                              onTap: () => _submitUpload(viewModel),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  height: 20,
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
                              )),
                        ),
                  ),
                ),
              ),
            )*/
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: StoreConnector<AppState, ViewModel>(
              converter: (store) => ViewModel.create(store),
              builder: (context, viewModel) => Material(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: InkWell(
                        onTap: () => _submitUpload(viewModel),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 20,
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
                        )),
                  ),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
      ),
    );
  }

  void _submitUpload(ViewModel viewModel) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    var form = formKey.currentState;

    if (_globalValidate(form)) {
      form.save();

      // Add overlay
      _alertOverlay = OverlayEntry(builder: (context) {
        return EditCardDialog(
          card: card,
          back: _alertOverlay.remove,
          viewModel: viewModel,
        );
      });
      Overlay.of(context).insert(_alertOverlay);

      print("Succeed");
    } else {
      if (categoryError || statusError) {
        _controller.animateTo(_controller.position.minScrollExtent,
            duration: Duration(milliseconds: 450), curve: Curves.decelerate);
      }
      print("Post submit failed");
    }
  }

  bool _globalValidate(var form) {
    bool _errrCategory = false, _errrStatus = false, validation = !form.validate();;
    if (card.type == null) _errrCategory = true;
    if (card.missing == null) _errrStatus = true;
    // search if repeated
    if (_errrCategory || _errrStatus || validation) {
      setState(() {
        categoryError = _errrCategory;
        statusError = _errrStatus;
      });
      return false;
    }
    card.id = new Random().nextInt(999999);
    return true;
  }
}
