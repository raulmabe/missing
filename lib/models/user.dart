import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:convert';
import './serializers.dart';
import './userLevel.dart';

part 'user.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder>{

  int get id;

  String get email;

  String get name;
  String get location;

  @nullable
  BuiltList<int> get image;

  @nullable
  int get countryCode;
  @nullable
  int get phone;

  UserLevel get level;
  int get active;


  UserModel._();
  factory UserModel([updates(UserModelBuilder b)]) = _$UserModel;
  
  static Serializer<UserModel> get serializer => _$userModelSerializer;



  String toJson(){
    return json.encode(serializers.serializeWith(UserModel.serializer, this));
  }

  static UserModel fromJson(String jsonString){
    return serializers.deserializeWith(UserModel.serializer, json.decode(jsonString));
  }

}
