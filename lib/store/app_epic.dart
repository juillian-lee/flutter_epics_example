import 'package:flutter_app_epics/store/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_app_epics/store/auth/auth_epic.dart';
import 'package:flutter_app_epics/store/conversas/conversas_epic.dart';

final epic = combineEpics<AppState>([]
    ..addAll(authEpics)
    ..addAll(conversasEpics)
);