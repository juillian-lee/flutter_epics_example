import 'dart:convert';

import 'package:flutter_app_epics/models/conversa.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_app_epics/store/conversas/conversas_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

Stream<dynamic> loadConversasEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions)
    .ofType(new TypeToken<LoadConversasAction>())
    .asyncMap((action) {
      final token = store.state.authState.token;
      var url = Uri.parse("http://192.168.0.6:4000/api/room");

      return http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": token
      }).then((response){
        var body = json.decode(response.body);
        var conversas = Conversa.fromList(body["rooms"]);
        return LoadConversasSuccessAction(conversas: conversas);
      });
    });
}

const conversasEpics = [
  loadConversasEpic
];