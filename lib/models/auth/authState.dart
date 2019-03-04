import '../userLevel.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import '../user.dart';

part 'authState.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  factory AuthState() {
    return _$AuthState._(
      password: '',
      active:  false,
      isAuthenticated: false,
    );
  }
  AuthState._();

  bool get isAuthenticated;

  @nullable
  UserModel get user;
  String get password;

  bool get active;

  @nullable
  String get error;

  @nullable
  String get status;

  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
