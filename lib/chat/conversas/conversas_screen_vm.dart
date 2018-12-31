

import 'package:flutter_app_epics/models/conversa.dart';
import 'package:flutter_app_epics/models/user_info.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class ConversasScreenVM {
  List<Conversa> conversas;
  bool isLoading;
  UserInfo userInfo;

  ConversasScreenVM({
    @required this.conversas,
    @required this.isLoading,
    @required this.userInfo
  });

  static ConversasScreenVM fromStore(Store<AppState> store) {
    final state = store.state;
    return ConversasScreenVM(
        conversas: state.conversasState.conversas,
        isLoading: state.conversasState.isLoading,
        userInfo: state.authState.userInfo
    );
  }
}