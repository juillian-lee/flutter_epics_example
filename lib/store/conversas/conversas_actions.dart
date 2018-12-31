
import 'package:flutter_app_epics/models/conversa.dart';
import 'package:meta/meta.dart';

class LoadConversasAction {}

class LoadConversasSuccessAction {
  final List<Conversa> conversas;

  LoadConversasSuccessAction({@required this.conversas});

}