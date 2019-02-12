import 'dart:async';
import '../../redux/auth/auth_actions.dart';
import 'package:redux/redux.dart';
import '../../models/appState.dart';
import './loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginPageBuilder extends StatelessWidget {
  const LoginPageBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.create(store),
      builder: (context, viewModel) {
        return LoginPage(viewModel: viewModel);
      },
    );
  }
}

class LoginViewModel {
  final Function(TempLoginModel, Function) onLogin;

  bool isLoading;

  LoginViewModel({this.onLogin, this.isLoading});

  factory LoginViewModel.create(Store<AppState> store) {
    _login(TempLoginModel loginModel, Function onComplete) {
      if(store.state.isLoading) return;
      Completer completer = Completer();
      store.dispatch(
          UserLoginRequest(completer: completer,email: loginModel.email.trim(), password: loginModel.password.trim()));
      completer.future.then((b) => onComplete(b, store.state.authState.error));
    }

    return LoginViewModel(onLogin: _login, isLoading: store.state.isLoading);
  }
}

class TempLoginModel {
  String email;
  String password;
}
