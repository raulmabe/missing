// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardStatus.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CardStatus _$waiting = const CardStatus._('WAITING');
const CardStatus _$approved = const CardStatus._('APPROVED');
const CardStatus _$rejected = const CardStatus._('REJECTED');
const CardStatus _$expired = const CardStatus._('EXPIRED');

CardStatus _$valueOf(String name) {
  switch (name) {
    case 'WAITING':
      return _$waiting;
    case 'APPROVED':
      return _$approved;
    case 'REJECTED':
      return _$rejected;
    case 'EXPIRED':
      return _$expired;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CardStatus> _$values =
    new BuiltSet<CardStatus>(const <CardStatus>[
  _$waiting,
  _$approved,
  _$rejected,
  _$expired,
]);

Serializer<CardStatus> _$cardStatusSerializer = new _$CardStatusSerializer();

class _$CardStatusSerializer implements PrimitiveSerializer<CardStatus> {
  @override
  final Iterable<Type> types = const <Type>[CardStatus];
  @override
  final String wireName = 'CardStatus';

  @override
  Object serialize(Serializers serializers, CardStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CardStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CardStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
