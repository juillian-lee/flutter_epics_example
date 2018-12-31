import 'dart:convert';

import 'package:flutter_app_epics/models/user_info.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_app_epics/store/auth/auth_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;


Stream<dynamic> loginActionEpic(Stream<dynamic>  actions, EpicStore<AppState> store) {
  return new Observable(actions)
      .ofType(new TypeToken<LoginAction>())
      .asyncMap((action){

          var url = Uri.parse("http://192.168.0.6:4000/api/login");

          var body = json.encode({
            "login": action.login,
            "senha": action.password
          });
          var headers = {
            "Content-Type": "application/json"
          };

          return http
              .post(url, body: body, headers: headers)
              .then((response) {
                  var body = json.decode(response.body);
                  return LoginSuccessAction(token: body["token"], userInfo: UserInfo.fromJson(body["userInfo"]));
              });

      });
}

const authEpics = [
  loginActionEpic
];