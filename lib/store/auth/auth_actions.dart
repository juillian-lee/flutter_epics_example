import 'package:flutter_app_epics/models/user_info.dart';
import 'package:meta/meta.dart';

class LoginAction {
  final String login;
  final String password;

  LoginAction({
    @required this.login,
    @required this.password
  });
}

class LoginSuccessAction {
  final UserInfo userInfo;
  final String token;

  LoginSuccessAction({
    @required this.token,
    @required this.userInfo
  });

}