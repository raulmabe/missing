import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import './appState.dart';
import './appTypes.dart';
import 'package:built_value/standard_json_plugin.dart';
import './card.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  CardModel,
  AppTypes
])

final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();