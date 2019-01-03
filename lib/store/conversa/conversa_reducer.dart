import 'package:flutter_app_epics/store/conversa/conversa_actions.dart';
import 'package:flutter_app_epics/store/conversa/conversa_state.dart';
import 'package:redux/redux.dart';

Reducer<ConversaState> conversaReducer = combineReducers([
 TypedReducer<ConversaState, LoadConversaAction>(loadConversaActionReducer)
]);

ConversaState loadConversaActionReducer(ConversaState state, LoadConversaAction action) {
  return state.rebuild((b) => b
    ..isLoading = true
    ..conversa = action.conversa
  );
}