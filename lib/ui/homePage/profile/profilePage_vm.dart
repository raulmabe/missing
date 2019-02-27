import 'package:redux/redux.dart';
import '../../../models/appState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../models/auth/authState.dart';
import './profilePage.dart';
import './preLoginPage.dart';

class ProfileBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      converter: (store) => AuthViewModel.create(store),
      builder: (context, viewModel) {
        if(viewModel.authState.isAuthenticated){
          return ProfilePage(
            viewModel: viewModel
          );
        }
        return PreLoginPage();
      },
    );
  }
}

class AuthViewModel {

  // User profile info
  final AuthState authState;

  AuthViewModel({this.authState});

  factory AuthViewModel.create(Store<AppState> store) {
    return AuthViewModel(
        authState: store.state.authState);
  }
}
