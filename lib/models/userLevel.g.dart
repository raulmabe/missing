// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userLevel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserLevel _$admin = const UserLevel._('ADMIN');
const UserLevel _$regular = const UserLevel._('REGULAR');

UserLevel _$valueOf(String name) {
  switch (name) {
    case 'ADMIN':
      return _$admin;
    case 'REGULAR':
      return _$regular;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserLevel> _$values = new BuiltSet<UserLevel>(const <UserLevel>[
  _$admin,
  _$regular,
]);

Serializer<UserLevel> _$userLevelSerializer = new _$UserLevelSerializer();

class _$UserLevelSerializer implements PrimitiveSerializer<UserLevel> {
  @override
  final Iterable<Type> types = const <Type>[UserLevel];
  @override
  final String wireName = 'UserLevel';

  @override
  Object serialize(Serializers serializers, UserLevel object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UserLevel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserLevel.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
