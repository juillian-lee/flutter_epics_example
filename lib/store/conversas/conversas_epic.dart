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
//      .map((action) {
//          var body = json.decode('{"status":"success","rooms":[{"to":{"nome":"Admin Livetouch","login":"admin@livetouch.com.br","id":3,"email":"admin@livetouch.com.br","dataUpdated":1542932193000,"dataCriacao":1542932193000,"avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/eaf5becc-b345-45f9-8020-35d3d30341eb/1507051466900/e8c2300cbe284196bf9d036ab5868068.png"},"messages":null,"lastMsg":{"msg":"ASDA","lida":false,"identifier":1544051665534,"id":565,"from":{"nome":"Juillian Lee","login":"juillianlee@livetouch.com.br","id":1,"email":"juillianlee@livetouch.com.br","dataUpdated":1542932090000,"dataCriacao":1542932090000,"avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/48e4eb1a-f606-4075-b588-e432aa85608a/1510938062037/3db936a73d4f4f73bec84776e3126847.jpg"},"enviada":true,"entregue":false,"data":1544051666000,"cId":1},"id":1,"from":{"nome":"Juillian Lee","login":"juillianlee@livetouch.com.br","id":1,"email":"juillianlee@livetouch.com.br","dataUpdated":1542932090000,"dataCriacao":1542932090000,"avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/48e4eb1a-f606-4075-b588-e432aa85608a/1510938062037/3db936a73d4f4f73bec84776e3126847.jpg"}},{"to":{"nome":"Ricardo Lecheta","login":"rlecheta@livetouch.com.br","id":4,"email":"rlecheta@livetouch.com.br","dataUpdated":1542932225000,"dataCriacao":1542932225000,"avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/52520eef-1028-450f-a31b-51813b9c92fe/1507051471110/e5e2190319d54eae836ae30bda24487f.png"},"messages":null,"lastMsg":{"msg":"opa","lida":false,"identifier":1544048027746,"id":564,"from":{"nome":"Juillian Lee","login":"juillianlee@livetouch.com.br","id":1,"email":"juillianlee@livetouch.com.br","dataUpdated":1542932090000,"dataCriacao":1542932090000,"avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/48e4eb1a-f606-4075-b588-e432aa85608a/1510938062037/3db936a73d4f4f73bec84776e3126847.jpg"},"enviada":true,"entregue":false,"data":1544048028000,"cId":3},"id":3,"from":{"nome":"Juillian Lee","login":"juillianlee@livetouch.com.br","id":1,"email":"juillianlee@livetouch.com.br","dataUpdated":1542932090000,"dataCriacao":1542932090000,"avatar":"https://livecom-chat.s3.amazonaws.com/livecomProd/48e4eb1a-f606-4075-b588-e432aa85608a/1510938062037/3db936a73d4f4f73bec84776e3126847.jpg"}}]}');
//          var conversas = Conversa.fromList(body["rooms"]);
//          return LoadConversasSuccessAction(conversas: conversas);
//      });
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