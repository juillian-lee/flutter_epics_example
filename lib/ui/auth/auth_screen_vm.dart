

import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_app_epics/store/auth/auth_actions.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AuthScreenVM {
  bool isLoading;
  final Function(String login, String password) onLoginPressed;

  AuthScreenVM({
    @required this.isLoading,
    @required this.onLoginPressed
  });

  static AuthScreenVM fromStore(Store<AppState> store) {
    return AuthScreenVM(
        isLoading: store.state.authState.isLoading,
        onLoginPressed: (String login, String password) {
          store.dispatch(LoginAction(login: login, password: password));
        }
    );
  }

}