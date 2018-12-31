import 'package:flutter_app_epics/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_app_epics/store/app_reducer.dart';
import 'package:flutter_app_epics/store/app_epic.dart';

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}

var epicMiddleware = new EpicMiddleware(epic);

final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [loggingMiddleware, epicMiddleware]
);