import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appTypes.g.dart';

class AppTypes extends EnumClass {
  /// Example of how to make an [EnumClass] serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_value code generator will provide the implementation. You need
  /// to do this for every type you want to serialize.
  static Serializer<AppTypes> get serializer => _$appTypesSerializer;

  static const AppTypes PEOPLE = _$people;
  static const AppTypes PETS = _$pets;
  static const AppTypes ITEMS = _$items;

  const AppTypes._(String name) : super(name);

  static BuiltSet<AppTypes> get values => _$values;
  static AppTypes valueOf(String name) => _$valueOf(name);
}
