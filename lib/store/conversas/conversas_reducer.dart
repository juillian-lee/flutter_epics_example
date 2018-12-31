import 'package:flutter_app_epics/store/conversas/conversas_actions.dart';
import 'package:flutter_app_epics/store/conversas/conversas_state.dart';
import 'package:redux/redux.dart';

Reducer<ConversasState> conversasReducer = combineReducers([
  TypedReducer<ConversasState, LoadConversasAction>(loadConversasActionReducer),
  TypedReducer<ConversasState, LoadConversasSuccessAction>(loadConversasSuccessActionReducer),
]);

ConversasState loadConversasActionReducer(ConversasState state, LoadConversasAction action) {
  return state.rebuild((b) => b
      ..isLoading = true
      ..conversas = []
  );
}


ConversasState loadConversasSuccessActionReducer(ConversasState state, LoadConversasSuccessAction action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..conversas = action.conversas
  );
}