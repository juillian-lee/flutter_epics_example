import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_app_epics/store/auth/auth_state.dart';
import 'package:flutter_app_epics/store/conversas/conversas_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;
  AuthState get authState;
  ConversasState get conversasState;

  factory AppState() {
    return _$AppState._(
      isLoading: false,
      authState: AuthState(),
      conversasState: ConversasState()
    );
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;

}