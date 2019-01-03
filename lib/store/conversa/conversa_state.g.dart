// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversa_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversaState> _$conversaStateSerializer =
    new _$ConversaStateSerializer();

class _$ConversaStateSerializer implements StructuredSerializer<ConversaState> {
  @override
  final Iterable<Type> types = const [ConversaState, _$ConversaState];
  @override
  final String wireName = 'ConversaState';

  @override
  Iterable serialize(Serializers serializers, ConversaState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.conversa != null) {
      result
        ..add('conversa')
        ..add(serializers.serialize(object.conversa,
            specifiedType: const FullType(Conversa)));
    }

    return result;
  }

  @override
  ConversaState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversaStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'conversa':
          result.conversa = serializers.deserialize(value,
              specifiedType: const FullType(Conversa)) as Conversa;
          break;
      }
    }

    return result.build();
  }
}

class _$ConversaState extends ConversaState {
  @override
  final bool isLoading;
  @override
  final Conversa conversa;

  factory _$ConversaState([void updates(ConversaStateBuilder b)]) =>
      (new ConversaStateBuilder()..update(updates)).build();

  _$ConversaState._({this.isLoading, this.conversa}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('ConversaState', 'isLoading');
    }
  }

  @override
  ConversaState rebuild(void updates(ConversaStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversaStateBuilder toBuilder() => new ConversaStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversaState &&
        isLoading == other.isLoading &&
        conversa == other.conversa;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), conversa.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversaState')
          ..add('isLoading', isLoading)
          ..add('conversa', conversa))
        .toString();
  }
}

class ConversaStateBuilder
    implements Builder<ConversaState, ConversaStateBuilder> {
  _$ConversaState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  Conversa _conversa;
  Conversa get conversa => _$this._conversa;
  set conversa(Conversa conversa) => _$this._conversa = conversa;

  ConversaStateBuilder();

  ConversaStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _conversa = _$v.conversa;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversaState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConversaState;
  }

  @override
  void update(void updates(ConversaStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversaState build() {
    final _$result =
        _$v ?? new _$ConversaState._(isLoading: isLoading, conversa: conversa);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
