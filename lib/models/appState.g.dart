// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appState.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'peopleCards',
      serializers.serialize(object.peopleCards,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CardModel)])),
      'petsCards',
      serializers.serialize(object.petsCards,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CardModel)])),
      'itemsCards',
      serializers.serialize(object.itemsCards,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CardModel)])),
      'authState',
      serializers.serialize(object.authState,
          specifiedType: const FullType(AuthState)),
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'peopleCards':
          result.peopleCards.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(CardModel)])) as BuiltList);
          break;
        case 'petsCards':
          result.petsCards.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(CardModel)])) as BuiltList);
          break;
        case 'itemsCards':
          result.itemsCards.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(CardModel)])) as BuiltList);
          break;
        case 'authState':
          result.authState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthState)) as AuthState);
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<CardModel> peopleCards;
  @override
  final BuiltList<CardModel> petsCards;
  @override
  final BuiltList<CardModel> itemsCards;
  @override
  final AuthState authState;
  @override
  final bool isLoading;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.peopleCards,
      this.petsCards,
      this.itemsCards,
      this.authState,
      this.isLoading})
      : super._() {
    if (peopleCards == null) {
      throw new BuiltValueNullFieldError('AppState', 'peopleCards');
    }
    if (petsCards == null) {
      throw new BuiltValueNullFieldError('AppState', 'petsCards');
    }
    if (itemsCards == null) {
      throw new BuiltValueNullFieldError('AppState', 'itemsCards');
    }
    if (authState == null) {
      throw new BuiltValueNullFieldError('AppState', 'authState');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        peopleCards == other.peopleCards &&
        petsCards == other.petsCards &&
        itemsCards == other.itemsCards &&
        authState == other.authState &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, peopleCards.hashCode), petsCards.hashCode),
                itemsCards.hashCode),
            authState.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('peopleCards', peopleCards)
          ..add('petsCards', petsCards)
          ..add('itemsCards', itemsCards)
          ..add('authState', authState)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<CardModel> _peopleCards;
  ListBuilder<CardModel> get peopleCards =>
      _$this._peopleCards ??= new ListBuilder<CardModel>();
  set peopleCards(ListBuilder<CardModel> peopleCards) =>
      _$this._peopleCards = peopleCards;

  ListBuilder<CardModel> _petsCards;
  ListBuilder<CardModel> get petsCards =>
      _$this._petsCards ??= new ListBuilder<CardModel>();
  set petsCards(ListBuilder<CardModel> petsCards) =>
      _$this._petsCards = petsCards;

  ListBuilder<CardModel> _itemsCards;
  ListBuilder<CardModel> get itemsCards =>
      _$this._itemsCards ??= new ListBuilder<CardModel>();
  set itemsCards(ListBuilder<CardModel> itemsCards) =>
      _$this._itemsCards = itemsCards;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _peopleCards = _$v.peopleCards?.toBuilder();
      _petsCards = _$v.petsCards?.toBuilder();
      _itemsCards = _$v.itemsCards?.toBuilder();
      _authState = _$v.authState?.toBuilder();
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              peopleCards: peopleCards.build(),
              petsCards: petsCards.build(),
              itemsCards: itemsCards.build(),
              authState: authState.build(),
              isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'peopleCards';
        peopleCards.build();
        _$failedField = 'petsCards';
        petsCards.build();
        _$failedField = 'itemsCards';
        itemsCards.build();
        _$failedField = 'authState';
        authState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
