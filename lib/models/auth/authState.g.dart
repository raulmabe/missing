// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authState.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthState> _$authStateSerializer = new _$AuthStateSerializer();

class _$AuthStateSerializer implements StructuredSerializer<AuthState> {
  @override
  final Iterable<Type> types = const [AuthState, _$AuthState];
  @override
  final String wireName = 'AuthState';

  @override
  Iterable serialize(Serializers serializers, AuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isAuthenticated',
      serializers.serialize(object.isAuthenticated,
          specifiedType: const FullType(bool)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
    ];
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.prefixNumber != null) {
      result
        ..add('prefixNumber')
        ..add(serializers.serialize(object.prefixNumber,
            specifiedType: const FullType(String)));
    }
    if (object.mobileNumber != null) {
      result
        ..add('mobileNumber')
        ..add(serializers.serialize(object.mobileNumber,
            specifiedType: const FullType(int)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  AuthState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isAuthenticated':
          result.isAuthenticated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'prefixNumber':
          result.prefixNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobileNumber':
          result.mobileNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthState extends AuthState {
  @override
  final bool isAuthenticated;
  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String location;
  @override
  final BuiltList<int> image;
  @override
  final String prefixNumber;
  @override
  final int mobileNumber;
  @override
  final String error;
  @override
  final String status;

  factory _$AuthState([void updates(AuthStateBuilder b)]) =>
      (new AuthStateBuilder()..update(updates)).build();

  _$AuthState._(
      {this.isAuthenticated,
      this.email,
      this.password,
      this.name,
      this.location,
      this.image,
      this.prefixNumber,
      this.mobileNumber,
      this.error,
      this.status})
      : super._() {
    if (isAuthenticated == null) {
      throw new BuiltValueNullFieldError('AuthState', 'isAuthenticated');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('AuthState', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('AuthState', 'password');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('AuthState', 'name');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('AuthState', 'location');
    }
  }

  @override
  AuthState rebuild(void updates(AuthStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        isAuthenticated == other.isAuthenticated &&
        email == other.email &&
        password == other.password &&
        name == other.name &&
        location == other.location &&
        image == other.image &&
        prefixNumber == other.prefixNumber &&
        mobileNumber == other.mobileNumber &&
        error == other.error &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, isAuthenticated.hashCode),
                                        email.hashCode),
                                    password.hashCode),
                                name.hashCode),
                            location.hashCode),
                        image.hashCode),
                    prefixNumber.hashCode),
                mobileNumber.hashCode),
            error.hashCode),
        status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('isAuthenticated', isAuthenticated)
          ..add('email', email)
          ..add('password', password)
          ..add('name', name)
          ..add('location', location)
          ..add('image', image)
          ..add('prefixNumber', prefixNumber)
          ..add('mobileNumber', mobileNumber)
          ..add('error', error)
          ..add('status', status))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState _$v;

  bool _isAuthenticated;
  bool get isAuthenticated => _$this._isAuthenticated;
  set isAuthenticated(bool isAuthenticated) =>
      _$this._isAuthenticated = isAuthenticated;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  ListBuilder<int> _image;
  ListBuilder<int> get image => _$this._image ??= new ListBuilder<int>();
  set image(ListBuilder<int> image) => _$this._image = image;

  String _prefixNumber;
  String get prefixNumber => _$this._prefixNumber;
  set prefixNumber(String prefixNumber) => _$this._prefixNumber = prefixNumber;

  int _mobileNumber;
  int get mobileNumber => _$this._mobileNumber;
  set mobileNumber(int mobileNumber) => _$this._mobileNumber = mobileNumber;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    if (_$v != null) {
      _isAuthenticated = _$v.isAuthenticated;
      _email = _$v.email;
      _password = _$v.password;
      _name = _$v.name;
      _location = _$v.location;
      _image = _$v.image?.toBuilder();
      _prefixNumber = _$v.prefixNumber;
      _mobileNumber = _$v.mobileNumber;
      _error = _$v.error;
      _status = _$v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthState;
  }

  @override
  void update(void updates(AuthStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthState build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
              isAuthenticated: isAuthenticated,
              email: email,
              password: password,
              name: name,
              location: location,
              image: _image?.build(),
              prefixNumber: prefixNumber,
              mobileNumber: mobileNumber,
              error: error,
              status: status);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
