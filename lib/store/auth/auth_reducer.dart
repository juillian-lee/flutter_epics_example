import 'package:flutter_app_epics/store/auth/auth_actions.dart';
import 'package:flutter_app_epics/store/auth/auth_state.dart';
import 'package:redux/redux.dart';


Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, LoginAction>(loginActionReducer),
  TypedReducer<AuthState, LoginSuccessAction>(loginSuccessActionReducer)
]);

AuthState loginActionReducer(AuthState state, LoginAction action) {
  return state.rebuild((b) => b
      ..userInfo = null
      ..isLoading = true
      ..token = ''
  );
}

AuthState loginSuccessActionReducer(AuthState state, LoginSuccessAction action) {
  return state.rebuild((b) => b
      ..userInfo = action.userInfo
      ..isLoading = false
      ..token = action.token
  );
}