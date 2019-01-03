import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_app_epics/store/auth/auth_reducer.dart';
import 'package:flutter_app_epics/store/conversas/conversas_reducer.dart';
import 'package:flutter_app_epics/store/conversa/conversa_reducer.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild((b) => b
      ..authState.replace(authReducer(state.authState, action))
      ..conversasState.replace(conversasReducer(state.conversasState, action))
      ..conversaState.replace(conversaReducer(state.conversaState, action))
  );
}