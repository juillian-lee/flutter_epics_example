

import 'package:flutter_app_epics/models/user.dart';
import 'package:intl/intl.dart';

class Message {
  int id;
  int cId;
  User from;
  String msg;
  int identifier;
  bool lida;
  bool enviada;
  bool entregue;
  int data;

  Message.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.cId = json['cId'];
    this.msg = json['msg'];
    this.lida = json['lida'];
    this.identifier = json['identifier'];
    this.from = User.fromJson(json['from']);
    this.enviada = json['enviada'];
    this.entregue = json['entregue'];
    this.data = json['data'];
  }

  String getDataFormatada() {
    final data = new DateTime.fromMicrosecondsSinceEpoch(this.data * 1000);
    final formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(data);
  }

}