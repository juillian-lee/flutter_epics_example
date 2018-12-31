import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_app_epics/models/conversa.dart';

part 'conversas_state.g.dart';

abstract class ConversasState implements Built<ConversasState, ConversasStateBuilder> {
  bool get isLoading;
  List<Conversa> get conversas;

  factory ConversasState() {
    return _$ConversasState._(
      isLoading: false,
      conversas: []
    );
  }
  ConversasState._();
  static Serializer<ConversasState> get serializer => _$conversasStateSerializer;

}