import '../actions.dart';
import '../../models/user.dart';
import 'dart:async';

class UserLoginRequest implements StartLoading {
  UserLoginRequest(
      {this.completer,
      this.email,
      this.password,});

  final Completer completer;
  final String email;
  final String password;
}

class UserLoginSuccess implements StopLoading {
  UserModel user;
  UserLoginSuccess(this.user);
}

class UserLoginFailure implements StopLoading {
  UserLoginFailure(this.error);

  final String error;
}

class UpdateStatus{
  UpdateStatus(this.status);
  final String status;
}