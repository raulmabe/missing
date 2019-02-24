import 'dart:async';
import '../../redux/auth/auth_actions.dart';
import 'package:redux/redux.dart';
import '../../models/appState.dart';
import './loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './modalSheet.dart';

class ModalSheetBuilder extends StatelessWidget {
  final TempLoginModel loginInfo;

  const ModalSheetBuilder({Key key, this.loginInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.create(store),
      builder: (context, viewModel) {
        return ModalBottomSheet(
          viewModel: viewModel,
          loginInfo: loginInfo,
        );
      },
    );
  }
}

class LoginViewModel {
  final Function(TempLoginModel, Function) onLogin;

  bool isLoading;

  final String status;

  LoginViewModel({this.onLogin, this.isLoading, this.status});

  factory LoginViewModel.create(Store<AppState> store) {
    _login(TempLoginModel loginModel, Function onComplete) {
      if (store.state.isLoading) return;
      Completer completer = Completer();
      store.dispatch(UserLoginRequest(
          completer: completer,
          email: loginModel.email.trim(),
          password: loginModel.password.trim()));
      completer.future.then((b) => onComplete(b, store.state.authState.error));
    }

    return LoginViewModel(
        onLogin: _login,
        isLoading: store.state.isLoading,
        status: store.state.authState.status);
  }
}

class TempLoginModel {
  String email;
  String password;
}
