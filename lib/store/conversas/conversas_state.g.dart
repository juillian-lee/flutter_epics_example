// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversas_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversasState> _$conversasStateSerializer =
    new _$ConversasStateSerializer();

class _$ConversasStateSerializer
    implements StructuredSerializer<ConversasState> {
  @override
  final Iterable<Type> types = const [ConversasState, _$ConversasState];
  @override
  final String wireName = 'ConversasState';

  @override
  Iterable serialize(Serializers serializers, ConversasState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'conversas',
      serializers.serialize(object.conversas,
          specifiedType:
              const FullType(List, const [const FullType(Conversa)])),
    ];

    return result;
  }

  @override
  ConversasState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversasStateBuilder();

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
        case 'conversas':
          result.conversas = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Conversa)]))
              as List<Conversa>;
          break;
      }
    }

    return result.build();
  }
}

class _$ConversasState extends ConversasState {
  @override
  final bool isLoading;
  @override
  final List<Conversa> conversas;

  factory _$ConversasState([void updates(ConversasStateBuilder b)]) =>
      (new ConversasStateBuilder()..update(updates)).build();

  _$ConversasState._({this.isLoading, this.conversas}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('ConversasState', 'isLoading');
    }
    if (conversas == null) {
      throw new BuiltValueNullFieldError('ConversasState', 'conversas');
    }
  }

  @override
  ConversasState rebuild(void updates(ConversasStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversasStateBuilder toBuilder() =>
      new ConversasStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversasState &&
        isLoading == other.isLoading &&
        conversas == other.conversas;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), conversas.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversasState')
          ..add('isLoading', isLoading)
          ..add('conversas', conversas))
        .toString();
  }
}

class ConversasStateBuilder
    implements Builder<ConversasState, ConversasStateBuilder> {
  _$ConversasState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  List<Conversa> _conversas;
  List<Conversa> get conversas => _$this._conversas;
  set conversas(List<Conversa> conversas) => _$this._conversas = conversas;

  ConversasStateBuilder();

  ConversasStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _conversas = _$v.conversas;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversasState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConversasState;
  }

  @override
  void update(void updates(ConversasStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversasState build() {
    final _$result = _$v ??
        new _$ConversasState._(isLoading: isLoading, conversas: conversas);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
