import 'package:flutter/material.dart';
import 'package:flutter_app_epics/ui/conversas/conversas_screen.dart';
import 'package:flutter_app_epics/store/app_state.dart';
import 'package:flutter_app_epics/store/conversas/conversas_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      onInit: (Store<AppState> store) {
        store.dispatch(LoadConversasAction());
      },
      builder: (BuildContext context, Store<AppState> store) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.7,
            title: Text(
                "Livecom Chat"
            ),
          ),
          body: ConversasScreen(),
          floatingActionButton: new FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            child: new Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: () => print("open chats"),
          ),
        );
      }
    );
  }
}