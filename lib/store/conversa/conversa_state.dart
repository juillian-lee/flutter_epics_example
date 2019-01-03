

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_app_epics/models/conversa.dart';

part 'conversa_state.g.dart';

abstract class ConversaState implements Built<ConversaState, ConversaStateBuilder> {
  bool get isLoading;

  @nullable
  Conversa get conversa;

  factory ConversaState() {
    return _$ConversaState._(
      isLoading: false,
      conversa: null
    );
  }

  ConversaState._();

  static Serializer<ConversaState> get serializer => _$conversaStateSerializer;

}