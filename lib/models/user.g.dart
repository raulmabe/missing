// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
      'level',
      serializers.serialize(object.level,
          specifiedType: const FullType(UserLevel)),
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(int)),
    ];
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.countryCode != null) {
      result
        ..add('countryCode')
        ..add(serializers.serialize(object.countryCode,
            specifiedType: const FullType(int)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
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
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(UserLevel)) as UserLevel;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String location;
  @override
  final BuiltList<int> image;
  @override
  final int countryCode;
  @override
  final int phone;
  @override
  final UserLevel level;
  @override
  final int active;

  factory _$UserModel([void updates(UserModelBuilder b)]) =>
      (new UserModelBuilder()..update(updates)).build();

  _$UserModel._(
      {this.id,
      this.email,
      this.name,
      this.location,
      this.image,
      this.countryCode,
      this.phone,
      this.level,
      this.active})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserModel', 'id');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('UserModel', 'email');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('UserModel', 'name');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('UserModel', 'location');
    }
    if (level == null) {
      throw new BuiltValueNullFieldError('UserModel', 'level');
    }
    if (active == null) {
      throw new BuiltValueNullFieldError('UserModel', 'active');
    }
  }

  @override
  UserModel rebuild(void updates(UserModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        id == other.id &&
        email == other.email &&
        name == other.name &&
        location == other.location &&
        image == other.image &&
        countryCode == other.countryCode &&
        phone == other.phone &&
        level == other.level &&
        active == other.active;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), email.hashCode),
                                name.hashCode),
                            location.hashCode),
                        image.hashCode),
                    countryCode.hashCode),
                phone.hashCode),
            level.hashCode),
        active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserModel')
          ..add('id', id)
          ..add('email', email)
          ..add('name', name)
          ..add('location', location)
          ..add('image', image)
          ..add('countryCode', countryCode)
          ..add('phone', phone)
          ..add('level', level)
          ..add('active', active))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  ListBuilder<int> _image;
  ListBuilder<int> get image => _$this._image ??= new ListBuilder<int>();
  set image(ListBuilder<int> image) => _$this._image = image;

  int _countryCode;
  int get countryCode => _$this._countryCode;
  set countryCode(int countryCode) => _$this._countryCode = countryCode;

  int _phone;
  int get phone => _$this._phone;
  set phone(int phone) => _$this._phone = phone;

  UserLevel _level;
  UserLevel get level => _$this._level;
  set level(UserLevel level) => _$this._level = level;

  int _active;
  int get active => _$this._active;
  set active(int active) => _$this._active = active;

  UserModelBuilder();

  UserModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _email = _$v.email;
      _name = _$v.name;
      _location = _$v.location;
      _image = _$v.image?.toBuilder();
      _countryCode = _$v.countryCode;
      _phone = _$v.phone;
      _level = _$v.level;
      _active = _$v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserModel;
  }

  @override
  void update(void updates(UserModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UserModel build() {
    _$UserModel _$result;
    try {
      _$result = _$v ??
          new _$UserModel._(
              id: id,
              email: email,
              name: name,
              location: location,
              image: _image?.build(),
              countryCode: countryCode,
              phone: phone,
              level: level,
              active: active);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
