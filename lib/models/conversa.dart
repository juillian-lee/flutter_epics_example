import 'package:flutter_app_epics/models/message.dart';
import 'package:flutter_app_epics/models/user.dart';
import 'package:flutter_app_epics/models/user_info.dart';

class Conversa {
  int id;
  User to;
  User from;
  Message lastMsg;
  List<Message> messages;


  Conversa.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.to = User.fromJson(json['to']);
    this.from = User.fromJson(json['from']);

    if(json['lastMsg'] != null) {
      this.lastMsg = Message.fromJson(json['lastMsg']);
    }

    if(json['messages'] != null) {
      print(json['messages']);
    }
  }


  static List<Conversa> fromList(rooms) {
    List<Conversa> conversas = [];
    for(var room in rooms) {
      conversas.add(Conversa.fromJson(room));
    }
    return conversas;
  }

  User getFrom(UserInfo userInfo) {
    if(to.id != userInfo.id) {
      return to;
    }

    return from;
  }

}