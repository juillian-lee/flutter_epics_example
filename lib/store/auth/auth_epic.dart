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
//      .map((action){
//          var body = json.decode('{"userInfo":{"nome":"Juillian Lee","login":"juillianlee@livetouch.com.br","id":1,"email":"juillianlee@livetouch.com.br","avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/48e4eb1a-f606-4075-b588-e432aa85608a/1510938062037/3db936a73d4f4f73bec84776e3126847.jpg"},"token":"Bearer: eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJjaGF0IiwiZXhwIjoxNTQ4NTkzMTE3LCJpYXQiOjE1NDYxNzM5MTcsImlzcyI6ImNoYXQiLCJqdGkiOiI3MWFlNDY2YS1hMmM4LTRiMDAtOTExOS1hNjE3MTZjYjAwM2EiLCJuYmYiOjE1NDYxNzM5MTYsInN1YiI6IjEiLCJ0eXAiOiJhY2Nlc3MifQ.zdfDcVvdrJkop2A-7hwW5FuKNfro5t_0YDBnZk9BLzsz3cqnF60zdIutpedO7hXGC6xrDPUnNbpeOwuyEfx6wQ","status":"success","message":"Login realizado com sucesso"}');
//          return LoginSuccessAction(token: body["token"], userInfo: UserInfo.fromJson(body["userInfo"]));
//      });
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