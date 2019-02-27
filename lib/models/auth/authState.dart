import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'authState.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  factory AuthState() {
    return _$AuthState._(
      email: '',
      password: '',
      name: '',
      location: '',
      isAuthenticated: false,
    );
  }
  AuthState._();

  bool get isAuthenticated;

  String get email;
  String get password;

  String get name;
  String get location;

  @nullable
  BuiltList<int> get image;

  @nullable
  String get prefixNumber;
  @nullable
  int get mobileNumber;

  @nullable
  String get error;

  @nullable
  String get status;

  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
