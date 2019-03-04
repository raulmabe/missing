import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cardStatus.g.dart';

class CardStatus extends EnumClass {
  /// Example of how to make an [EnumClass] serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<CardStatus> get serializer => _$cardStatusSerializer;

  static const CardStatus WAITING = _$waiting;
  static const CardStatus APPROVED = _$approved;
  static const CardStatus REJECTED = _$rejected;
  static const CardStatus EXPIRED = _$expired;

  const CardStatus._(String name) : super(name);

  static BuiltSet<CardStatus> get values => _$values;
  static CardStatus valueOf(String name) => _$valueOf(name);
}
