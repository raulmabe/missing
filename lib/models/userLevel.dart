import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'userLevel.g.dart';

class UserLevel extends EnumClass {
  /// Example of how to make an [EnumClass] serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<UserLevel> get serializer => _$userLevelSerializer;

  static const UserLevel ADMIN = _$admin;
  static const UserLevel REGULAR = _$regular;

  const UserLevel._(String name) : super(name);

  static BuiltSet<UserLevel> get values => _$values;
  static UserLevel valueOf(String name) => _$valueOf(name);
}
