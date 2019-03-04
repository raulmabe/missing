import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import './appState.dart';
import './appTypes.dart';
import 'package:built_value/standard_json_plugin.dart';
import './card.dart';
import './userLevel.dart';
import './cardStatus.dart';
import './auth/authState.dart';
import './user.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  CardModel,
  AppTypes,
  AuthState,
  UserLevel,
  CardStatus,
  UserModel
])

final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();