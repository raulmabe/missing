import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authState.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  factory AuthState() {
    return _$AuthState._(
      email: '',
      password: '',
      isAuthenticated: false,
    );
  }
  AuthState._();

  bool get isAuthenticated;

  String get email;
  String get password;

  @nullable
  String get prefixNumber;
  @nullable
  int get mobileNumber;

  @nullable
  String get error;

  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
