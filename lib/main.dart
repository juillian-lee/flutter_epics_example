import 'package:flutter/material.dart';
import 'package:flutter_app_epics/ui/auth/auth_screen.dart';
import 'package:flutter_app_epics/ui/home_screen.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app_epics/store/app_store.dart';
import 'package:redux/redux.dart';

void main() => runApp(MaterialApp(
  title: "Chat App",
  home: MyApp(),
));


class MyAppVM {
  bool isLoading;
  String token;

  MyAppVM({
    @required this.isLoading,
    @required this.token,
  });


  static MyAppVM fromStore(Store<AppState> store) {
    return MyAppVM(
      isLoading: store.state.authState.isLoading,
      token: store.state.authState.token
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, MyAppVM>(
        converter: (store) => MyAppVM.fromStore(store),
        builder: (context, MyAppVM state) {
          if(state.token == null || state.token.isEmpty) {
            return AuthScreen();
          }
          return HomeScreen();
        },
      )
    );
  }
}
