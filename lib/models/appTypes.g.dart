// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appTypes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppTypes _$people = const AppTypes._('PEOPLE');
const AppTypes _$pets = const AppTypes._('PETS');
const AppTypes _$items = const AppTypes._('ITEMS');

AppTypes _$valueOf(String name) {
  switch (name) {
    case 'PEOPLE':
      return _$people;
    case 'PETS':
      return _$pets;
    case 'ITEMS':
      return _$items;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppTypes> _$values = new BuiltSet<AppTypes>(const <AppTypes>[
  _$people,
  _$pets,
  _$items,
]);

Serializer<AppTypes> _$appTypesSerializer = new _$AppTypesSerializer();

class _$AppTypesSerializer implements PrimitiveSerializer<AppTypes> {
  @override
  final Iterable<Type> types = const <Type>[AppTypes];
  @override
  final String wireName = 'AppTypes';

  @override
  Object serialize(Serializers serializers, AppTypes object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AppTypes deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppTypes.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
