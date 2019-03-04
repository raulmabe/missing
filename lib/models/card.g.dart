// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CardModel> _$cardModelSerializer = new _$CardModelSerializer();

class _$CardModelSerializer implements StructuredSerializer<CardModel> {
  @override
  final Iterable<Type> types = const [CardModel, _$CardModel];
  @override
  final String wireName = 'CardModel';

  @override
  Iterable serialize(Serializers serializers, CardModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AppTypes)),
      'missing',
      serializers.serialize(object.missing,
          specifiedType: const FullType(bool)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'createdTime',
      serializers.serialize(object.createdTime,
          specifiedType: const FullType(DateTime)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(CardStatus)),
    ];
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType: const FullType(BuiltList, const [
              const FullType(BuiltList, const [const FullType(int)])
            ])));
    }
    if (object.modificatedTime != null) {
      result
        ..add('modificatedTime')
        ..add(serializers.serialize(object.modificatedTime,
            specifiedType: const FullType(DateTime)));
    }

    return result;
  }

  @override
  CardModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CardModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'images':
          result.images.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(BuiltList, const [const FullType(int)])
              ])) as BuiltList);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(AppTypes)) as AppTypes;
          break;
        case 'missing':
          result.missing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'createdTime':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'modificatedTime':
          result.modificatedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(CardStatus)) as CardStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$CardModel extends CardModel {
  @override
  final BuiltList<BuiltList<int>> images;
  @override
  final int id;
  @override
  final AppTypes type;
  @override
  final bool missing;
  @override
  final String title;
  @override
  final String description;
  @override
  final String location;
  @override
  final BuiltList<String> tags;
  @override
  final DateTime createdTime;
  @override
  final DateTime modificatedTime;
  @override
  final CardStatus status;

  factory _$CardModel([void updates(CardModelBuilder b)]) =>
      (new CardModelBuilder()..update(updates)).build();

  _$CardModel._(
      {this.images,
      this.id,
      this.type,
      this.missing,
      this.title,
      this.description,
      this.location,
      this.tags,
      this.createdTime,
      this.modificatedTime,
      this.status})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('CardModel', 'id');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('CardModel', 'type');
    }
    if (missing == null) {
      throw new BuiltValueNullFieldError('CardModel', 'missing');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('CardModel', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('CardModel', 'description');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('CardModel', 'location');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('CardModel', 'tags');
    }
    if (createdTime == null) {
      throw new BuiltValueNullFieldError('CardModel', 'createdTime');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('CardModel', 'status');
    }
  }

  @override
  CardModel rebuild(void updates(CardModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CardModelBuilder toBuilder() => new CardModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardModel &&
        images == other.images &&
        id == other.id &&
        type == other.type &&
        missing == other.missing &&
        title == other.title &&
        description == other.description &&
        location == other.location &&
        tags == other.tags &&
        createdTime == other.createdTime &&
        modificatedTime == other.modificatedTime &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, images.hashCode),
                                            id.hashCode),
                                        type.hashCode),
                                    missing.hashCode),
                                title.hashCode),
                            description.hashCode),
                        location.hashCode),
                    tags.hashCode),
                createdTime.hashCode),
            modificatedTime.hashCode),
        status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardModel')
          ..add('images', images)
          ..add('id', id)
          ..add('type', type)
          ..add('missing', missing)
          ..add('title', title)
          ..add('description', description)
          ..add('location', location)
          ..add('tags', tags)
          ..add('createdTime', createdTime)
          ..add('modificatedTime', modificatedTime)
          ..add('status', status))
        .toString();
  }
}

class CardModelBuilder implements Builder<CardModel, CardModelBuilder> {
  _$CardModel _$v;

  ListBuilder<BuiltList<int>> _images;
  ListBuilder<BuiltList<int>> get images =>
      _$this._images ??= new ListBuilder<BuiltList<int>>();
  set images(ListBuilder<BuiltList<int>> images) => _$this._images = images;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  AppTypes _type;
  AppTypes get type => _$this._type;
  set type(AppTypes type) => _$this._type = type;

  bool _missing;
  bool get missing => _$this._missing;
  set missing(bool missing) => _$this._missing = missing;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  DateTime _modificatedTime;
  DateTime get modificatedTime => _$this._modificatedTime;
  set modificatedTime(DateTime modificatedTime) =>
      _$this._modificatedTime = modificatedTime;

  CardStatus _status;
  CardStatus get status => _$this._status;
  set status(CardStatus status) => _$this._status = status;

  CardModelBuilder();

  CardModelBuilder get _$this {
    if (_$v != null) {
      _images = _$v.images?.toBuilder();
      _id = _$v.id;
      _type = _$v.type;
      _missing = _$v.missing;
      _title = _$v.title;
      _description = _$v.description;
      _location = _$v.location;
      _tags = _$v.tags?.toBuilder();
      _createdTime = _$v.createdTime;
      _modificatedTime = _$v.modificatedTime;
      _status = _$v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CardModel;
  }

  @override
  void update(void updates(CardModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CardModel build() {
    _$CardModel _$result;
    try {
      _$result = _$v ??
          new _$CardModel._(
              images: _images?.build(),
              id: id,
              type: type,
              missing: missing,
              title: title,
              description: description,
              location: location,
              tags: tags.build(),
              createdTime: createdTime,
              modificatedTime: modificatedTime,
              status: status);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CardModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
