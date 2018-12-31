import 'package:flutter/material.dart';
import 'package:flutter_app_epics/chat/conversas/conversas_screen_vm.dart';
import 'package:flutter_app_epics/models/conversa.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ConversasScreen extends StatefulWidget {

  @override
  _ConversasScreenState createState() => _ConversasScreenState();
}

class _ConversasScreenState extends State<ConversasScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ConversasScreenVM>(
      converter: (store) => ConversasScreenVM.fromStore(store),
      builder: (context, state) {
        final conversas = state.conversas;
        final userInfo = state.userInfo;

        return ListView.builder(
            itemCount: conversas.length,
            itemBuilder: (context, index) {
              final Conversa conversa = conversas[index];
              final user = conversa.getFrom(userInfo);
              final lastMsg = conversa.lastMsg;

              return Column(
                children: <Widget>[
                  index == 0 ? Container() : Divider(),
                  ListTile(
                    leading: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(user.avatar)
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          user.nome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          lastMsg.getDataFormatada() ?? '',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0
                          ),
                        )
                      ],
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        conversa.lastMsg.msg ?? '',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
        );
      },
    );
  }
}
