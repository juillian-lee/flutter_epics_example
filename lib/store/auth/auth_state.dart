import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_app_epics/models/user_info.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder>{
  bool get isLoading;
  String get token;

  @nullable
  UserInfo get userInfo;

  factory AuthState() {
    return _$AuthState._(
      token: '',
      userInfo: null,
      isLoading: false
    );
  }


  AuthState._();
  static Serializer<AuthState> get serializer => _$authStateSerializer;
}